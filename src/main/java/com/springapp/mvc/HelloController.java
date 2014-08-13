package com.springapp.mvc;

import com.forView.AccountUnit;
import com.forView.validators.AccountFormValidator;
import com.services.AttributeService;
import com.services.NotificationService;
import com.services.SecurityService;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import persistance.model.Notification;
import persistance.model.User;

import javax.validation.Valid;
import java.util.List;

@Controller

public class HelloController {

    @Autowired
    private AttributeService attributeService;

    @Autowired
    private UserService userService;

    @Autowired
    private AccountFormValidator accountFormValidator;

    @Autowired
    private NotificationService notificationService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage() {
        if (SecurityService.hasRole("ROLE_STUDENT"))
            return "redirect:student";

        if (SecurityService.hasRole("ROLE_CURATOR"))
            return "redirect:curator";

        if (SecurityService.hasRole("ROLE_WORKER"))
            return "HRworker";

        if (SecurityService.hasRole("ROLE_ADMIN"))
            return "redirect:admin";

        return "login";
    }

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(ModelMap modelMap) {
        String login = UserService.getCurrentUserLogin();
        User user = userService.getByLogin(login);
        AccountUnit accountUnit = new AccountUnit();
        accountUnit.setFirstName(user.getFirstName());
        accountUnit.setLogin(login);
        accountUnit.setSecondName(user.getSecondName());
        accountUnit.setEmail(user.getEmail());
        accountUnit.setSkype(user.getSkype());
        accountUnit.setTelephone(user.getTelephone());
        modelMap.addAttribute("accountUnit", accountUnit);
        return "account";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(ModelMap modelMap, @Valid @ModelAttribute("accountUnit") AccountUnit accountUnit, BindingResult result) {
        accountUnit.setLogin(UserService.getCurrentUserLogin());
        accountFormValidator.validate(accountUnit, result);
        if (!result.hasErrors()) {
            if(!accountUnit.getNewPassword().equals("") &&
                    accountUnit.getNewPassword()!=null) {
                userService.setPassword(UserService.getCurrentUserLogin() ,accountUnit.getNewPassword());
            }
            User user = userService.getByLogin(UserService.getCurrentUserLogin());
            user.setEmail(accountUnit.getEmail());
            user.setSkype(accountUnit.getSkype());
            user.setTelephone(accountUnit.getTelephone());
            userService.update(user);

            modelMap.addAttribute("accountUnit", accountUnit);
        }
        return "account";
    }

    @RequestMapping(value = "/notif", method = RequestMethod.GET)
    public String showNotifs(ModelMap modelMap){
        List<Notification> notifications = userService.getAllNotifications(UserService.getCurrentUserLogin());
        String login = UserService.getCurrentUserLogin();
        modelMap.addAttribute("notifs", notifications);
        modelMap.addAttribute("name", userService.getFirstName(login)+" "+userService.getSecondName(login));
        return "notificationList";
    }

    @RequestMapping(value = "/notif/{notifId}", method = RequestMethod.GET)
    public String showNotif(ModelMap modelMap, @PathVariable("notifId")Long id){
        Notification notification = notificationService.getNotificationById(id);
        if(notification.getUser().getLogin().equals(UserService.getCurrentUserLogin()))
            notificationService.setRead(id);
        notification.setText(notification.getText().replaceAll("\n", "<br>"));
        System.out.println(notification.getText());
        modelMap.addAttribute("notif", notification);
        return "notification";
    }

    @RequestMapping(value = "/notif/update", method = RequestMethod.GET)
    public @ResponseBody
    int getNumberOfUnreadNotifications(@ModelAttribute("initials") String initials){
        if (userService.getAllUnreadNotifications(UserService.getCurrentUserLogin()) == null)
            return 0;
        else
            return userService.getAllUnreadNotifications(UserService.getCurrentUserLogin()).size();
    }

    @RequestMapping(value = "/getRegexpByAttrName", method = RequestMethod.GET)
    public @ResponseBody
    String getRegexpByAttrName(@ModelAttribute("attr") String attr){
        return attributeService.getByName(attr).getPattern();
    }
}
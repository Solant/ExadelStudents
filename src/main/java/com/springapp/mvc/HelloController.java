package com.springapp.mvc;

import com.services.ExcelTableService;
import com.services.SecurityService;
import com.services.StudentService;
import com.services.WordTableService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TestService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;

@Controller

public class HelloController {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(ModelMap model,HttpSession session) {
        session.setAttribute("account", SecurityContextHolder.getContext().getAuthentication().getName());
        if (SecurityService.hasRole("ROLE_STUDENT"))
            return "redirect:student";
        if (SecurityService.hasRole("ROLE_CURATOR"))
            return "redirect:curator";
        if (SecurityService.hasRole("ROLE_ADMIN"))
            return "redirect:admin";

        return "login";
    }
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(){
        return "account";
    }
    @Autowired
    private StudentService ss;

    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public void welcomePage(HttpServletResponse response) {
        //ss.add("Wasya", "wasya", "wasya", "wasya");

        /*ExcelTableService ets = new ExcelTableService();

        for (int i = 0; i < 10; i++) {
            ets.addNewRow();
            for (int k = 0; k < 10; k++)
                ets.addNewCell("Я Алёша " + i + " " + k);
        }
        ets.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.xls");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ets.writeInStream(os);*/
        WordTableService wts = new WordTableService("Test table");

        for (int i = 0; i < 10; i++) {
            wts.addNewRow();
            for (int k = 0; k < 20; k++)
                wts.addNewCell("Я Алёша " + i + " " + k);
        }
        wts.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.doc");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        wts.writeInStream(os);
    }
}
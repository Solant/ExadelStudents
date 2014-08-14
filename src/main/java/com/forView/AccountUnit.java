package com.forView;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Max;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Created by Надя on 31.07.2014.
 */
public class AccountUnit {

    private String login;
    private String firstName;
    private String secondName;
    private String password;
    private String newPassword;
    private String confirmedPassword;


    @Size(max = 30, message = "Email can not contain more than 30 symbols")
    @Email
    private String email;


    @Size(max = 30, message = "Telephone number can not contain more than 30 symbols")
    @Pattern(regexp = "^\\+?[0-9\\-()]*$", message = "Wrong telephone number.")
    private String telephone;

    @Size(max = 30, message = "Skype can not contain more than 30 symbols")
    @Pattern(regexp = "^[a-zA-Z0-9,\\._-]*$", message = "Wrong skype login.")
    private String skype;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmedPassword() {
        return confirmedPassword;
    }

    public void setConfirmedPassword(String confirmedPassword) {
        this.confirmedPassword = confirmedPassword;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

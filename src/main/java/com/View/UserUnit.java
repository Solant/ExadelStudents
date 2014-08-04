package com.View;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

/**
 * Created by Надя on 25.07.2014.
 */
public class UserUnit {

    @NotEmpty(message = "Login must not be empty")
    @Pattern(regexp = "^[A-Za-z0-9_-]{3,18}$", message = "Wrong login." +
            " Possible symbols are latin symbols, numbers, \"-\". Must contain more than 3 symbols.")
    private String login;

    @NotEmpty(message = "Password must not be empty")
    @Pattern(regexp = "^[A-Za-z0-9_-]{6,18}$", message = "Wrong password." +
            " Possible symbols are latin symbols, numbers, \"-\". Must contain more than 6 symbols. ")
    private String password;

    @NotEmpty(message = "Last name must not be empty")
    @Pattern(regexp = "^[A-Za-z\\-\\s]+$", message = "Wrong last name." +
            " Possible symbols are latin symbols, \"-\" and space")
    private String lastname;

    @NotEmpty(message = "First name must not be empty")
    @Pattern(regexp = "^[A-Za-z\\s]+$", message = "Wrong first name." +
            " Possible symbols are latin symbols and space")
    private String firstname;

    private Role role;
   // private Status status;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

   /* public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
*/
    public enum Role{
        Student, Feedbacker, Admin
    }

    /*public enum Status{
        WORKING, STUDYING
    }*/
    // public
    // private List<String> role;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }


}

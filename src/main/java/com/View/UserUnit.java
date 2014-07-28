package com.View;

/**
 * Created by Надя on 25.07.2014.
 */
public class UserUnit {
    private String login;
    private String password;
    private String lastname;
    private String firstname;
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public enum Role{
        Student, Feedbacker, Admin
    }
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

    /*public List<String> getRole() {
        return role;
    }

    public void setRole(List<String> role) {
        this.role = role;
    }*/
}

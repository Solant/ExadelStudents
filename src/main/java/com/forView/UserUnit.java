package com.forView;

/**
 * Created by Надя on 25.07.2014.
 */
public class UserUnit {
    private String login;
    private String password;
    private String lastname;
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

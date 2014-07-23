package persistance.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table (name = "Users")
public class Student {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "login")
    private String login;

    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private boolean enabled;


    @Column (name = "firstname")
    private String firstName;

    @Column (name = "secondname")
    private String secondName;

    @OneToMany(mappedBy = "myStudents", fetch = FetchType.LAZY)
    private Set<Feedbacker> curators;

    @OneToMany(mappedBy = "interviewedStudents", fetch = FetchType.LAZY)
    private Set<Feedbacker> interviewers;

    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY)
    private Set<Project> oldProjects;

    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY)
    private Set<Review> reviews;

    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY)
    private Set<Value> values;

    public Student() {
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public Set<Value> getValues() {
        return values;
    }

    public void setValues(Set<Value> values) {
        this.values = values;
    }

    public Set<Feedbacker> getCurators() {
        return curators;
    }

    public void setCurators(Set<Feedbacker> curators) {
        this.curators = curators;
    }

    public Set<Feedbacker> getInterviewers() {
        return interviewers;
    }

    public void setInterviewers(Set<Feedbacker> interviewers) {
        this.interviewers = interviewers;
    }

    public Set<Project> getOldProjects() {
        return oldProjects;
    }

    public void setOldProjects(Set<Project> oldProjects) {
        this.oldProjects = oldProjects;
    }

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

}

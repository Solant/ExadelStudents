package persistance.model;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.annotations.CascadeType;

@Entity
@DiscriminatorValue("student")
public class Student extends User {

    @Column (name = "firstname")
    private String firstName;

    @Column (name = "secondname")
    private String secondName;

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "StudentsAndCurators", joinColumns = {@JoinColumn(name = "StudId")}, inverseJoinColumns = {@JoinColumn(name = "CurId")})
    private Set<Feedbacker> curators = new HashSet();

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "StudentsAndInterviewers", joinColumns = {@JoinColumn(name = "StudId")}, inverseJoinColumns = {@JoinColumn(name = "IntervId")})
    private Set<Feedbacker> interviewers = new HashSet();

    @OneToMany(mappedBy = "student")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
   // @JoinColumn(name = "studId")
    private Set<Project> oldProjects = new HashSet();

    @OneToMany(mappedBy = "student")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
    //@JoinColumn(name = "studId")
    private Set<Review> reviews = new HashSet();

    @OneToMany(mappedBy = "student")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
    //@JoinColumn(name = "studId")
    private Set<Value> values = new HashSet();

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

}

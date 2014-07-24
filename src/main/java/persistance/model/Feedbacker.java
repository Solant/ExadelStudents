package persistance.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@DiscriminatorValue("feedbacker")
public class Feedbacker extends User{

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "secondname")
    private String secondName;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "StudentsAndCurators", joinColumns = {@JoinColumn(name = "CurId")}, inverseJoinColumns = {@JoinColumn(name = "StudId")})
    private Set<Student> myStudents = new HashSet();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "StudentsAndInterviewers", joinColumns = {@JoinColumn(name = "IntervId")}, inverseJoinColumns = {@JoinColumn(name = "StudId")})
    private Set<Student> interviewedStudents = new HashSet();

    @OneToMany(mappedBy = "feedbacker", fetch = FetchType.LAZY)
    private Set <Review> reviews = new HashSet();

    public Feedbacker() {
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


    public Set<Student> getMyStudents() {
        return myStudents;
    }

    public void setMyStudents(Set<Student> myStudents) {
        this.myStudents = myStudents;
    }

    public Set<Student> getInterviewedStudents() {
        return interviewedStudents;
    }

    public void setInterviewedStudents(Set<Student> interviewedStudents) {
        this.interviewedStudents = interviewedStudents;
    }

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

}

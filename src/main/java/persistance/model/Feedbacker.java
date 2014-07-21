package persistance.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table (name = "Feedbackers")
public class Feedbacker {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String firstName;

    @Column
    private String secondName;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "StudentsAndCurators", joinColumns = @JoinColumn(name = "CurId"), inverseJoinColumns = @JoinColumn(name = "StudId"))
    private Set<Student> myStudents;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "StudentsAndInterviewers", joinColumns = @JoinColumn(name = "IntervId"), inverseJoinColumns = @JoinColumn(name = "StudId"))
    private Set<Student> interviewedStudents;

    @OneToMany(mappedBy = "feedbacker", fetch = FetchType.LAZY)
    private Set <Review> reviews;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

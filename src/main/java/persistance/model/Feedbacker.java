package persistance.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@DiscriminatorValue("feedbacker")
public class Feedbacker extends User{

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "StudentsAndCurators", joinColumns = {@JoinColumn(name = "CurId")}, inverseJoinColumns = {@JoinColumn(name = "StudId")})
    private Set<Student> myStudents = new HashSet();

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "StudentsAndInterviewers", joinColumns = {@JoinColumn(name = "IntervId")}, inverseJoinColumns = {@JoinColumn(name = "StudId")})
    private Set<Student> interviewedStudents = new HashSet();

    @OneToMany(mappedBy = "feedbacker")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
    private Set <Review> reviews = new HashSet();

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "UsersAndTechnologies", joinColumns = {@JoinColumn(name = "feedbacker_id")}, inverseJoinColumns = {@JoinColumn(name = "technology_id")})
    private Set<Technology> myTechnologies = new HashSet();

    public Feedbacker() {
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

    public Set<Technology> getMyTechnologies() {
        return myTechnologies;
    }

    public void setMyTechnologies(Set<Technology> myTechnologies) {
        this.myTechnologies = myTechnologies;
    }


}

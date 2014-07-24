package persistance.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Calendar;

@Entity
@Table (name = "Projects")
public class Project
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "projName")
    private String projName;


    @ManyToOne
    @JoinColumn(name = "studId")
    private Student student;


    @ManyToOne
    @JoinColumn(name = "curId")
    private Feedbacker curator;

    public Project() {
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Feedbacker getCurator() {
        return curator;
    }

    public void setCurator(Feedbacker curator) {
        this.curator = curator;
    }

}

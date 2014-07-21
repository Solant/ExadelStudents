package persistance.model;

import javax.persistence.*;
import java.util.Calendar;

@Entity
@Table (name = "Projects")
public class Project
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "projName")
    private String projName;


    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "studId")
    private Student student;


    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "curId")
    Feedbacker curator;

    public Project() {
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

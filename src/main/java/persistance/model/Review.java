package persistance.model;

import javax.persistence.*;
import java.util.Calendar;

@Entity
@Table (name = "Reviews")
public class Review
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "status")
    private int status;

    @Column(name = "comment")
    private String comment;

    @Column(name = "date")
    private Calendar date;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn/*(name = "studId")*/
    private Student student;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn/*(name = "feedbId")*/
    private Feedbacker feedbacker;


    public Review() {
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public Feedbacker getFeedbacker() {
        return feedbacker;
    }

    public void setFeedbacker(Feedbacker feedbacker) {
        this.feedbacker = feedbacker;
    }
}

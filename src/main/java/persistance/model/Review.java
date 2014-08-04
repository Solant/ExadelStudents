package persistance.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table (name = "Reviews")
public class Review
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "suitability")
    private boolean suitability;

    @Column(name = "work_attitude")
    private String workAttitude;

    @Column(name = "team_attitude")
        private String teamAttitude;

    @Column(name = "prof_progress")
    private String profProgress;

    @Column(name = "need_more_hours")
    private boolean needMoreHours;

    @Column(name = "working_on_real_project")
    private String workingOnRealProject; // No (has/doesn't have perspective) / Yes

    @Column(name = "billable")
    private boolean billable;

    @Column(name = "fromInterview")
    private boolean fromInterview; //or from curator

    @Column(name = "comment")
    private String comment;

    @Column(name = "date")
    private Calendar date;

    @ManyToOne
    @JoinColumn(name = "studId")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "feedbId")
    private Feedbacker feedbacker;


    @OneToMany(mappedBy = "review")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
    private Set<Rating> ratings = new HashSet<Rating>();


    public Review() {
    }

    public boolean isFromInterview() {
        return fromInterview;
    }

    public boolean isBillable() {
        return billable;
    }

    public void setBillable(boolean billable) {
        this.billable = billable;
    }

    public boolean isSuitability() {
        return suitability;
    }

    public void setSuitability(boolean suitability) {
        this.suitability = suitability;
    }

    public String getWorkAttitude() {
        return workAttitude;
    }

    public void setWorkAttitude(String workAttitude) {
        this.workAttitude = workAttitude;
    }

    public String getTeamAttitude() {
        return teamAttitude;
    }

    public void setTeamAttitude(String teamAttitude) {
        this.teamAttitude = teamAttitude;
    }

    public String getProfProgress() {
        return profProgress;
    }

    public void setProfProgress(String profProgress) {
        this.profProgress = profProgress;
    }

    public boolean isNeedMoreHours() {
        return needMoreHours;
    }

    public void setNeedMoreHours(boolean needMoreHours) {
        this.needMoreHours = needMoreHours;
    }

    public String getWorkingOnRealProject() {
        return workingOnRealProject;
    }

    public void setWorkingOnRealProject(String workingOnRealProject) {
        this.workingOnRealProject = workingOnRealProject;
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

    public boolean getFromInterview() {
        return fromInterview;
    }

    public void setFromInterview(boolean fromInterview) {
        this.fromInterview = fromInterview;
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

    public Feedbacker getFeedbacker() {
        return feedbacker;
    }

    public void setFeedbacker(Feedbacker feedbacker) {
        this.feedbacker = feedbacker;
    }

    public Set<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(Set<Rating> ratings) {
        this.ratings = ratings;
    }
}

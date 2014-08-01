package persistance.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Technologies")
public class Technology {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "technology_name")
    private String technologyName;

    @ManyToMany
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinTable(name = "UsersAndTechnologies", joinColumns = {@JoinColumn(name = "technology_id")}, inverseJoinColumns = {@JoinColumn(name = "feedbacker_id")})
    private Set<Feedbacker> feedbackers = new HashSet();

    @OneToMany(mappedBy = "technology")
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE, CascadeType.DELETE_ORPHAN})
    private Set<Rating> ratings = new HashSet();

    public Technology() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTechnologyName() {
        return technologyName;
    }

    public void setTechnologyName(String technologyName) {
        this.technologyName = technologyName;
    }

    public Set<Feedbacker> getFeedbackers() {
        return feedbackers;
    }

    public void setFeedbackers(Set<Feedbacker> feedbackers) {
        this.feedbackers = feedbackers;
    }

    public Set<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(Set<Rating> ratings) {
        this.ratings = ratings;
    }

}

package persistance.model;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Calendar;

@Entity
@Table(name = "notifications")
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "text")
    private String text;

    @Column(name = "sender")
    private String sender;

    @Column(name = "time_when_sent")
    private Calendar timeWhenSent;

    @Column(name = "time_when_read")
    private Calendar timeWhenRead;

    @Column(name = "have_been_read")
    private boolean isRead;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Notification() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Calendar getTimeWhenSent() {
        return timeWhenSent;
    }

    public void setTimeWhenSent(Calendar timeWhenSent) {
        this.timeWhenSent = timeWhenSent;
    }

    public Calendar getTimeWhenRead() {
        return timeWhenRead;
    }

    public void setTimeWhenRead(Calendar timeWhenRead) {
        this.timeWhenRead = timeWhenRead;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }
}

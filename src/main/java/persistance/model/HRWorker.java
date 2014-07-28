package persistance.model;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.annotations.CascadeType;

@Entity
@DiscriminatorValue("hrworker")
public class HRWorker extends User {

    @Column (name = "firstname")
    private String firstName;

    @Column (name = "secondname")
    private String secondName;

    public HRWorker() {
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
}

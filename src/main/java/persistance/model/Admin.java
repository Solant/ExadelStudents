package persistance.model;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.annotations.CascadeType;

@Entity
@DiscriminatorValue("admin")
public class Admin extends User {


    public Admin() {
    }

}

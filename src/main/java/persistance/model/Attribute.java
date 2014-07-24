package persistance.model;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "Attributes")
public class Attribute {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "attrName")
    private String attributeName;

    @Column(name = "status")
    private int status;

    @Column(name = "type")
    private String type;

    @OneToMany(mappedBy = "attribute", fetch = FetchType.LAZY)
    private Set<Value> values;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "groupId")
    private Group group;

    public Attribute() {
    }

    public Set<Value> getValues() {
        return values;
    }

    public void setValues(Set<Value> values) {
        this.values = values;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }


}

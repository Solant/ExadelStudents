package persistance.model;

import javax.persistence.*;

@Entity
@Table(name = "Values")
public class Value {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "value")
    private String value;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "studId")
    private Student student;

    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name = "attrId")
    private Attribute attribute;

    public Value() {
    }

    public Attribute getAttribute() {
        return attribute;
    }

    public void setAttribute(Attribute attribute) {
        this.attribute = attribute;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String textValue) {
        this.value = textValue;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

}
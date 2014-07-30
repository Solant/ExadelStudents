package persistance.dao;

import org.hibernate.SessionFactory;
import persistance.model.Student;

import java.util.List;

/**
 * Created by user on 15.07.2014.
 */
public interface StudentDao extends GenericDao<Student> {
    public Student findByLogin(String login);
}

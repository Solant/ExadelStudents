package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.StudentDao;
import persistance.model.Student;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentDaoImpl extends GenericDaoImpl<Student> implements StudentDao {
    @SuppressWarnings("unchecked")
    public Student findByLogin(String login) {

        List<Student> students = new ArrayList<Student>();

        students = sessionFactory.getCurrentSession().createCriteria(Student.class)
                .add(Restrictions.eq("login", login)).list();

        if (students.size() > 0) {
            return students.get(0);
        } else {
            return null;
        }
    }
}

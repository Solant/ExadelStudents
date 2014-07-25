package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.StudentDao;
import persistance.model.Feedbacker;
import persistance.model.Student;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentDaoImpl extends GenericDaoImpl<Student> implements StudentDao {

    public List<Student> findDisabledStudents() {
        //
        List<Student> disabledStudents = new ArrayList<Student>();
        return disabledStudents;
    }
}

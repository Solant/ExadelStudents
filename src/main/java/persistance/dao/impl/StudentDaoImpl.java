package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.StudentDao;
import persistance.model.Feedbacker;
import persistance.model.Student;

@Repository
public class StudentDaoImpl extends GenericDaoImpl<Student> implements StudentDao {

}

package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.StudentDao1;
import persistance.model.Student;

@Repository
public class StudentDao1 extends GenericDaoImpl<Student> implements StudentDao1 {

}

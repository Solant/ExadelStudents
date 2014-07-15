package persistance.dao.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.hibernate.SessionFactory;
import persistance.dao.StudentDAO;


public class StudentDAOImpl implements StudentDAO {

    private HibernateTemplate hibernateTemplate;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.hibernateTemplate = new HibernateTemplate(sessionFactory);
    }

}

package persistance.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import persistance.dao.UserDao;
import persistance.model.User;

public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public User findByUserName(String login) {

        List<User> users = new ArrayList<User>();

        users = getSessionFactory().getCurrentSession()
                .createQuery("from User where login=?")
                .setParameter(0, login).list();

        if (users.size() > 0) {
            return users.get(0);
        } else {
            return null;
        }

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
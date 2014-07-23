package persistance.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import persistance.dao.UserDao;
import persistance.model.User;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {

    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public User findByUserName(String login) {

        List<User> users = new ArrayList<User>();

        users = sessionFactory.getCurrentSession().createCriteria(User.class)
                .add(Restrictions.eq("login", login)).list();

        if (users.size() > 0) {
            return users.get(0);
        } else {
            return null;
        }

    }

    public SessionFactory setSessionFactory()
    {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
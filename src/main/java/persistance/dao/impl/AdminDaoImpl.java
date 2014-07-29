package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.AdminDao;
import persistance.model.Admin;

import java.util.ArrayList;
import java.util.List;


@Repository
public class AdminDaoImpl extends GenericDaoImpl<Admin> implements AdminDao {
    @SuppressWarnings("unchecked")
    public Admin findByLogin(String login) {

        List<Admin> admins;

        admins = sessionFactory.getCurrentSession().createCriteria(Admin.class)
                .add(Restrictions.eq("login", login)).list();

        if (admins.size() > 0) {
            return admins.get(0);
        } else {
            return null;
        }
    }
}

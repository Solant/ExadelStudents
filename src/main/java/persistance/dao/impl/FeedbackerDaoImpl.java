package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.FeedbackerDao;
import persistance.model.Feedbacker;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FeedbackerDaoImpl extends GenericDaoImpl<Feedbacker> implements FeedbackerDao {
    @SuppressWarnings("unchecked")
    public Feedbacker findByLogin(String login) {

        List<Feedbacker> feedbackers = new ArrayList<Feedbacker>();

        feedbackers = sessionFactory.getCurrentSession().createCriteria(Feedbacker.class)
                .add(Restrictions.eq("login", login)).list();

        if (feedbackers.size() > 0) {
            return feedbackers.get(0);
        } else {
            return null;
        }
    }
}

package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.HRWorkerDao;
import persistance.model.HRWorker;

import java.util.ArrayList;
import java.util.List;

@Repository
public class HRWorkerDaoImpl extends GenericDaoImpl<HRWorker> implements HRWorkerDao {
    @SuppressWarnings("unchecked")
    public HRWorker findByLogin(String login) {

        List<HRWorker> hrWorkers = new ArrayList<HRWorker>();

        hrWorkers = sessionFactory.getCurrentSession().createCriteria(HRWorker.class)
                .add(Restrictions.eq("login", login)).list();

        if (hrWorkers.size() > 0) {
            return hrWorkers.get(0);
        } else {
            return null;
        }
    }
}

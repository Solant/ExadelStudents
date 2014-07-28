package persistance.dao;

import persistance.model.Feedbacker;

public interface FeedbackerDao extends GenericDao<Feedbacker> {

    public Feedbacker findByLogin(String login);
}

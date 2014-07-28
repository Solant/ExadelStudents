package persistance.dao;

import persistance.model.HRWorker;

public interface HRWorkerDao extends GenericDao<HRWorker> {

    public HRWorker findByLogin(String login);
}

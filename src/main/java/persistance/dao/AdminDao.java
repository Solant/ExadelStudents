package persistance.dao;

import persistance.model.Admin;

public interface AdminDao extends GenericDao<Admin> {
    public Admin findByLogin(String login);
}

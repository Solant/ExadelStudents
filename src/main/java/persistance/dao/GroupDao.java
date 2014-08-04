package persistance.dao;

import persistance.model.Group;

import java.util.List;

public interface GroupDao extends GenericDao<Group> {
    public List<Group> getByStatus(String status);
    public Group findByName(String name);
}

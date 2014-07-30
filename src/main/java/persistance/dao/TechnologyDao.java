package persistance.dao;

import persistance.model.Technology;

public interface TechnologyDao extends GenericDao<Technology> {
    public Technology findByName(String name);
}

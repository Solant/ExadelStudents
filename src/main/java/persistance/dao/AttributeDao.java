package persistance.dao;

import persistance.model.Attribute;

public interface AttributeDao extends GenericDao<Attribute> {
    public Attribute findByName(String name);

}

package persistance.dao.impl;


import org.springframework.stereotype.Repository;
import persistance.dao.AttributeDao;
import persistance.model.Attribute;

@Repository
public class AttributeDaoImpl extends GenericDaoImpl<Attribute> implements AttributeDao {
}

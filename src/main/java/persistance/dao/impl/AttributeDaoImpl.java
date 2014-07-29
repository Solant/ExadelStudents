package persistance.dao.impl;


import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import persistance.dao.AttributeDao;
import persistance.model.Attribute;
import java.util.List;

@Repository
public class AttributeDaoImpl extends GenericDaoImpl<Attribute> implements AttributeDao {
    public Attribute findByName(String name){

        List<Attribute> attributes;
        attributes = sessionFactory.getCurrentSession().createCriteria(Attribute.class)
                .add(Restrictions.eq("attributeName", name)).list();

        if (attributes.size() > 0) {
            return attributes.get(0);
        } else {
            return null;
        }
    }
}

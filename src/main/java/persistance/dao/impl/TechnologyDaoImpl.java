package persistance.dao.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import persistance.dao.TechnologyDao;
import persistance.model.Technology;

import java.util.List;

@Repository
public class TechnologyDaoImpl extends GenericDaoImpl<Technology> implements TechnologyDao {
    public Technology findByName(String name){

            List<Technology> technologies;

            technologies = sessionFactory.getCurrentSession().createCriteria(Technology.class)
                    .add(Restrictions.eq("technologyName", name)).list();

            if(technologies.size() > 0)
                return technologies.get(0);
            else
                return null;


    }
}

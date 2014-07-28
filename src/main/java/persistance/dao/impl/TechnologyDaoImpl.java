package persistance.dao.impl;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import persistance.dao.TechnologyDao;
import persistance.model.Technology;

@Repository
public class TechnologyDaoImpl extends GenericDaoImpl<Technology> implements TechnologyDao {
}

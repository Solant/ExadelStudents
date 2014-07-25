package persistance.dao.impl;

import org.springframework.stereotype.Controller;
import persistance.dao.TechnologyDao;
import persistance.model.Technology;

@Controller
public class TechnologyDaoImpl extends GenericDaoImpl<Technology> implements TechnologyDao {
}

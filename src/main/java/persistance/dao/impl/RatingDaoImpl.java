package persistance.dao.impl;

import org.springframework.stereotype.Controller;
import persistance.dao.RatingDao;
import persistance.model.Rating;

@Controller
public class RatingDaoImpl extends GenericDaoImpl<Rating> implements RatingDao {
}

package persistance.dao.impl;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import persistance.dao.RatingDao;
import persistance.model.Rating;

@Repository
public class RatingDaoImpl extends GenericDaoImpl<Rating> implements RatingDao {
}

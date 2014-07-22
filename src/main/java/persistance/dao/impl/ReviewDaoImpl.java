package persistance.dao.impl;

import org.springframework.stereotype.Repository;
import persistance.dao.ReviewDao;
import persistance.model.Review;

@Repository
public class ReviewDaoImpl extends GenericDaoImpl<Review> implements ReviewDao {
}

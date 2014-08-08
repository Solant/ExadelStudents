package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.ReviewDao;
import persistance.model.Review;

@Service
public class ReviewService {

    @Autowired
    private ReviewDao reviewDao;

    @Transactional
    public Review getReviewById(long id){
        Review review = reviewDao.findById(id);
        review.getRatings().size();
        return review;
    }
}

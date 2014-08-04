package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.RatingDao;
import persistance.dao.TechnologyDao;
import persistance.model.Rating;
import persistance.model.Review;
import persistance.model.Technology;

@Service
public class TechnologyService {

    @Autowired
    private TechnologyDao technologyDao;

    @Autowired
    private RatingDao ratingDao;

    @Transactional
    public void add(String name){
        Technology technology = new Technology();
        technology.setTechnologyName(name);
        technologyDao.save(technology);
    }

    @Transactional
    public boolean isTechnologyAvailable(String name){
        return technologyDao.findByName(name) == null;
    }

    @Transactional
    public void remove(String name){
        technologyDao.removeById(technologyDao.findByName(name).getId());
    }

    @Transactional
    public void addRating(short rating, String technologyName, Review review){
        Rating r = new Rating();
        r.setRating(rating);
        r.setReview(review);
        r.setTechnology(technologyDao.findByName(technologyName));
        ratingDao.save(r);
    }
}

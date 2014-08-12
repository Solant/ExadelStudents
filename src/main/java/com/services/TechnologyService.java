package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.RatingDao;
import persistance.dao.ReviewDao;
import persistance.dao.TechnologyDao;
import persistance.model.Rating;
import persistance.model.Review;
import persistance.model.Technology;

import java.util.List;

@Service
public class TechnologyService {

    @Autowired
    private TechnologyDao technologyDao;

    @Autowired
    private RatingDao ratingDao;

    @Autowired
    private ReviewDao reviewDao;

    @Transactional
    public void add(String name){
        Technology technology = new Technology();
        technology.setTechnologyName(name);
        technologyDao.save(technology);
    }

    @Transactional
    public void changeTechnology(String oldName, String newName){
        Technology technology = technologyDao.findByName(oldName);
        technology.setTechnologyName(newName);
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
    public List<Technology> getAllTechnologies(){
        return technologyDao.findAll();
    }

    @Transactional
    public void addRating(short rating, String technologyName, Review review){
        Rating r = new Rating();
        r.setRating(rating);
        if (reviewDao.findById(review.getId()) == null)
            reviewDao.save(review);
        r.setReview(review);
        r.setTechnology(technologyDao.findByName(technologyName));
        ratingDao.save(r);
    }
}

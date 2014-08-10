package com.services;

import com.forView.JSONFeedbacker;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.FeedbackerDao;
import persistance.dao.TechnologyDao;
import persistance.model.Feedbacker;
import persistance.model.Student;
import persistance.model.Technology;
import persistance.model.UserRole;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class FeedbackerService {

    @Autowired
    private FeedbackerDao feedbackerDao;

    @Autowired
    private TechnologyDao technologyDao;

    @Transactional
    public Feedbacker getFeedbackerByLogin(String login){
        return feedbackerDao.findByLogin(login);
    }

    @Transactional
    public List<Feedbacker> getAllFeedbackers(){
        return feedbackerDao.findAll();
    }

    @Transactional
    public void add(String login, String password, String name, String surname){
        Feedbacker feedbacker = new Feedbacker();

        feedbacker.setEnabled(true);
        feedbacker.setLogin(login);
        feedbacker.setPassword(UserService.stringToSha256(password));
        feedbacker.setFirstName(name);
        feedbacker.setSecondName(surname);

        UserRole ur = new UserRole();
        ur.setRole("ROLE_CURATOR");
        ur.setUser(feedbacker);
        feedbacker.getUserRoles().add(ur);

        feedbackerDao.save(feedbacker);
    }

    @Transactional
    public void remove(String login){
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbackerDao.removeById(feedbacker.getId());
    }

    /**
     * Get supervised students of feedbacker
     *
     * @param feedbackerLogin Feedbacker Login
     * @return Set<Student>
     */
    @Transactional
    public Set<Student> getSupervisedStudents(String feedbackerLogin){
        return new HashSet<Student>(feedbackerDao.findByLogin(feedbackerLogin).getMyStudents());
    }

    /**
     * Returns Set of Students interviewed by feedbacker
     *
     * @param feedbackerLogin Feedbacker Login
     * @return Set<Student>
     */
    @Transactional
    public Set<Student> getInterviewedStudents(String feedbackerLogin){
        return  new HashSet<Student>(feedbackerDao.findByLogin(feedbackerLogin).getInterviewedStudents());
    }

    @Transactional
    public void addTechnology(String login, String technologyName){
        Technology technology = technologyDao.findByName(technologyName);
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbacker.getMyTechnologies().add(technology);
        feedbackerDao.update(feedbacker);
    }

    /**
     *Get all feedbackers by technology
     *
     * @param technologyName Technology
     * @return Set<Feedbacker>
     */
    @Transactional
    public Set<Feedbacker> getFeedbackersByTechnology(String technologyName){
        return new HashSet<Feedbacker>(technologyDao.findByName(technologyName).getFeedbackers());
    }

    @Transactional
    public List<JSONFeedbacker> filterFeedbackers(String technologyName){
        List<JSONFeedbacker> jsonFeedbackers = new ArrayList();
        if(technologyName.equals("Any")){
            for(Feedbacker f : getAllFeedbackers()) {
                JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
                jsonFeedbacker.setSecondName(f.getSecondName());
                jsonFeedbacker.setLogin(f.getLogin());
                jsonFeedbackers.add(jsonFeedbacker);
            }
        }
        else{
                for(Feedbacker f : getFeedbackersByTechnology(technologyName)) {
                    JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
                    jsonFeedbacker.setSecondName(f.getSecondName());
                    jsonFeedbacker.setLogin(f.getLogin());
                    jsonFeedbackers.add(jsonFeedbacker);
                }
        }
        return jsonFeedbackers;

    }
}

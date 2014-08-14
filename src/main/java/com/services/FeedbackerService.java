package com.services;

import com.forView.JSONFeedbacker;
import com.forView.JSONStudent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import persistance.dao.FeedbackerDao;
import persistance.dao.StudentDao;
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

    @Autowired
    private UserService userService;

    @Autowired
    private StudentDao studentDao;

    @Transactional
    public Feedbacker getFeedbackerByLoginWithTechs(String login){
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbacker.getMyTechnologies().size();
        return feedbacker;
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
        Set<Student> studentSet = new HashSet<Student>();
        for(Student student: feedbackerDao.findByLogin(feedbackerLogin).getMyStudents()){
            if(userService.getByLogin(student.getLogin()).isEnabled()){
                studentSet.add(student);
            }
        }
        return studentSet ;
    }

    /**
     * Returns Set of Students interviewed by feedbacker
     *
     * @param feedbackerLogin Feedbacker Login
     * @return Set<Student>
     */
    @Transactional
    public Set<Student> getInterviewedStudents(String feedbackerLogin){
        Set<Student> studentSet = new HashSet<Student>();
        for(Student student: feedbackerDao.findByLogin(feedbackerLogin).getInterviewedStudents()){
            if(userService.getByLogin(student.getLogin()).isEnabled()){
                studentSet.add(student);
            }
        }
        return studentSet;
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
        List<JSONFeedbacker> jsonFeedbackers = new ArrayList<JSONFeedbacker>();
        if(technologyName.equals("Any")){
            for(Feedbacker f : getAllFeedbackers()) {
                JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
                jsonFeedbacker.setSecondName(f.getSecondName());
                jsonFeedbacker.setFirstName(f.getFirstName());
                jsonFeedbacker.setLogin(f.getLogin());
                jsonFeedbackers.add(jsonFeedbacker);
            }
        }
        else{
                for(Feedbacker f : getFeedbackersByTechnology(technologyName)) {
                    JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
                    jsonFeedbacker.setSecondName(f.getSecondName());
                    jsonFeedbacker.setFirstName(f.getFirstName());
                    jsonFeedbacker.setLogin(f.getLogin());
                    jsonFeedbackers.add(jsonFeedbacker);
                }
        }
        return jsonFeedbackers;

    }

    @Transactional
    public Set<Feedbacker> getCuratorsByStudent(String studentLogin){
        return studentDao.findByLogin(studentLogin).getCurators();
    }

    @Transactional
    public List<JSONFeedbacker> getJSONCuratorsByStudent(String studentLogin){
        List<JSONFeedbacker> jsonFeedbackers = new ArrayList<JSONFeedbacker>();
        for(Feedbacker f : getCuratorsByStudent(studentLogin)) {
                JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
                jsonFeedbacker.setSecondName(f.getSecondName());
                jsonFeedbacker.setFirstName(f.getFirstName());
                jsonFeedbacker.setLogin(f.getLogin());
                jsonFeedbackers.add(jsonFeedbacker);
            }
        return jsonFeedbackers;
    }
    @Transactional
    public Set<Feedbacker> getInterviewersByStudent(String studentLogin){
        return studentDao.findByLogin(studentLogin).getInterviewers();
    }

    @Transactional
    public List<JSONFeedbacker> getJSONInterviewersByStudent(String studentLogin){
        List<JSONFeedbacker> jsonFeedbackers = new ArrayList<JSONFeedbacker>();
        for(Feedbacker f : getInterviewersByStudent(studentLogin)) {
            JSONFeedbacker jsonFeedbacker = new JSONFeedbacker();
            jsonFeedbacker.setSecondName(f.getSecondName());
            jsonFeedbacker.setFirstName(f.getFirstName());
            jsonFeedbacker.setLogin(f.getLogin());
            jsonFeedbackers.add(jsonFeedbacker);
        }
        return jsonFeedbackers;
    }

    @Transactional
    public List<JSONStudent> getJSONSupervisedStudents(String feedbackerLogin) {
        List<JSONStudent> jsonStudents = new ArrayList<JSONStudent>();
        for(Student student:getSupervisedStudents(feedbackerLogin)){
            JSONStudent jsonStudent = new JSONStudent();
            jsonStudent.setSecondName(student.getSecondName());
            jsonStudent.setFirstName(student.getFirstName());
            jsonStudent.setLogin(student.getLogin());
            jsonStudents.add(jsonStudent);
        }
        return jsonStudents;
    }

    @Transactional
    public List<JSONStudent> getJSONInterviewedStudents(String feedbackerLogin) {
        List<JSONStudent> jsonStudents = new ArrayList<JSONStudent>();
        for(Student student:getInterviewedStudents(feedbackerLogin)){
            JSONStudent jsonStudent = new JSONStudent();
            jsonStudent.setSecondName(student.getSecondName());
            jsonStudent.setFirstName(student.getFirstName());
            jsonStudent.setLogin(student.getLogin());
            jsonStudents.add(jsonStudent);
        }
        return jsonStudents;
    }

    @Transactional
    public void unlink(String login1, String login2, boolean isCurator){
        Set<Student> students = new HashSet<Student>();
        Feedbacker feedbacker;
        String studentLogin;
        if((feedbacker = feedbackerDao.findByLogin(login1)) != null){
            studentLogin = login2;
        }
        else{
            feedbacker = feedbackerDao.findByLogin(login2);
            studentLogin = login1;
        }
        if(isCurator) {
            for(Student student: feedbacker.getMyStudents()){
                if(!student.getLogin().equals(studentLogin)){
                    students.add(student);
                }
            }
            feedbacker.setMyStudents(students);
        }
        else{
            for(Student student:feedbacker.getInterviewedStudents()){
                if(!student.getLogin().equals(studentLogin)){
                    students.add(student);
                }
            }
            feedbacker.setInterviewedStudents(students);
        }
        feedbackerDao.update(feedbacker);
    }

    @Transactional
    public void removeAllTechs(String login){
        Feedbacker feedbacker = feedbackerDao.findByLogin(login);
        feedbacker.setMyTechnologies(new HashSet<Technology>());
        feedbackerDao.update(feedbacker);
    }
}

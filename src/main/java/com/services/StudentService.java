package com.services;

import com.services.presentation.GAVPresentation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import persistance.dao.*;
import persistance.model.*;

import java.util.*;

@Service
public class StudentService {

    public final int ALL = 2;
    public final int ENABLED = 1;
    public final int DISABLED = 0;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private AttributeDao attributeDao;

    @Autowired
    private FeedbackerDao feedbackerDao;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private GroupDao groupDao;

    @Autowired
    private NotificationDao notificationDao;

    @Transactional
    public Student getStudentByLogin(String login){
        return studentDao.findByLogin(login);
    }

    /**
     * Returns all enabled students
     * @return List<Student>
     */
    @Transactional
    public List<Student> getAllEnabledStudents(){
        List<Student> students = studentDao.findAll();
        List<Student> studentsRet = new ArrayList<Student>();
        for(Student student : students)
            if (student.isEnabled())
                studentsRet.add(student);
        return studentsRet;
    }

    @Transactional
    public void setStatus(String studentLogin, String status) {
        Set<Value> values = attributeDao.findByName("status").getValues();
        for (Value value : values){
            if (value.getStudent().getLogin().equalsIgnoreCase(studentLogin)) {
                value.setValue(status);
                break;
            }
        }
        attributeDao.update(attributeDao.findByName("status"));
    }

    @Transactional
    public String getFirstName(String login){
        return studentDao.findByLogin(login).getFirstName();
    }

    @Transactional
    public String getSecondName(String login){
        return studentDao.findByLogin(login).getSecondName();
    }

    /**
     * Creates new student
     *
     * @param login    - Student login
     * @param password - Student password
     * @param name     - Student name
     * @param surname  - Student second name
     */
    @Transactional
    public void add(String login, String password, String name, String surname, String status) {
        Student student = new Student();

        student.setLogin(login);
        student.setPassword(password);
        student.setFirstName(name);
        student.setSecondName(surname);
        student.setEnabled(true);

        UserRole ur = new UserRole();
        ur.setRole("ROLE_STUDENT");
        ur.setUser(student);
        student.getUserRoles().add(ur);

        Attribute attribute = attributeDao.findByName("status");
        Set<Value> values = attribute.getValues();
        Value val = new Value();
        val.setAttribute(attribute);
        val.setStudent(student);
        val.setValue(status);
        values.add(val);

        studentDao.save(student);
        attributeDao.update(attribute);
    }

    /**
     * Sets student values
     *
     * @param studentLogin - Student login
     * @param gavList - ArrayList of GAVPresentation
     */
    @Transactional
    public void setValues(String studentLogin, List<GAVPresentation> gavList) {
        Student student = studentDao.findByLogin(studentLogin);
        for(GAVPresentation gav : gavList){
            Set<Value> values = attributeDao.findByName(gav.getAttribute()).getValues();
            boolean edited = false;
            for(Value value : values){
                if (value.getStudent().getLogin().equalsIgnoreCase(studentLogin)){
                    edited = true;
                    value.setValue(gav.getValue());
                    break;
                }
            }
            if (!edited){
                Value value = new Value();
                value.setStudent(student);
                value.setValue(gav.getValue());
                value.setAttribute(attributeDao.findByName(gav.getAttribute()));
                attributeDao.findByName(gav.getAttribute()).getValues().add(value);
            }
            attributeDao.update(attributeDao.findByName(gav.getAttribute()));
        }
    }

    /**
     * Returns ArrayList of GAVPresentation with all student attribute groups, attributes and values
     *
     * @param studentLogin - Student login
     * @return ArrayList<GAVPresentation>
     */
    @Transactional
    public List<GAVPresentation> getValues(String studentLogin) {
        String status = "";
        Attribute a = attributeDao.findByName("status");
        Set<Value> valuesS = a.getValues();
        for(Value valera : valuesS){
            if (valera.getStudent().getLogin().equalsIgnoreCase(studentLogin)){
                status = valera.getValue();
                break;
            }
        }

        List<Group> groups = groupDao.getByStatus(status);
        List<GAVPresentation> gavs = new ArrayList<GAVPresentation>();
        for(Group group : groups){
            Set<Attribute> attributes = group.getAttributes();
            for(Attribute attribute : attributes){
                Set<Value> values = attribute.getValues();
                GAVPresentation gav = new GAVPresentation();
                gav.setGroup(group.getName());
                gav.setAttribute(attribute.getAttributeName());
                gav.setType(attribute.getType());
                gav.setValue("");
                for(Value value : values)
                    if(value.getStudent().getLogin().equalsIgnoreCase(studentLogin))
                        gav.setValue(value.getValue());
                gavs.add(gav);
            }
        }

        return gavs;
    }

    @Transactional
    public void addReview(String studentLogin, String curatorLogin, Review review) {
        review.setFeedbacker(feedbackerDao.findByLogin(curatorLogin));
        review.setStudent(studentDao.findByLogin(studentLogin));
        review.setDate(Calendar.getInstance());

        reviewDao.save(review);
    }

    /**
     * Add Interviewer for a student
     * @param interviewerLogin - Interviewer's login
     * @param studentLogin - - Student's login
     */
    @Transactional
    public void addInterviewer(String interviewerLogin, String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        Feedbacker feedbacker = feedbackerDao.findByLogin(interviewerLogin);
        student.getInterviewers().add(feedbacker);

        studentDao.update(student);
    }

    /**
     * Add curator for a student
     *
     * @param interviewerLogin - Curator's login
     * @param studentLogin - Student's login
     */
    @Transactional
    public void addCurator(String interviewerLogin, String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        Feedbacker feedbacker = feedbackerDao.findByLogin(interviewerLogin);
        student.getCurators().add(feedbacker);

        studentDao.update(student);
    }

    /**
     * Disable user
     *
     * @param studentLogin - Student Login
     */
    @Transactional
    public void disable(String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(false);

        studentDao.update(student);
    }

    /**
     * Enable user
     *
     * @param studentLogin - Student login
     */
    @Transactional
    public void enable(String studentLogin) {
        Student student = studentDao.findByLogin(studentLogin);
        student.setEnabled(true);

        studentDao.update(student);
    }

    @Transactional
    public List<Review> getReviews(String login){
        List<Review> reviews = reviewDao.findAll();
        List<Review> rev = new ArrayList<Review>();
        for(Review review : reviews)
            if (review.getStudent().getLogin().equalsIgnoreCase(login))
                rev.add(review);
        return rev;
    }

    @Transactional
    public Review getLastReview(String login){
        Set<Review> reviews = studentDao.findByLogin(login).getReviews();
        Review r = null;
        for(Review review : reviews){
            if (r == null)
                r = review;
            else
                if (r.getDate().before(review.getDate()))
                    r = review;
        }
        return r;
    }

    /**
     * Get all notifications for student
     *
     * @param login Student login
     * @return List<Notification>
     */
    @Transactional
    public List<Notification> getAllNotifications(String login){
        List<Notification> notifications = notificationDao.findAll();
        List<Notification> notificationsReturn = new ArrayList<Notification>();
        for(Notification notification : notifications)
            if (notification.getUser().getLogin().equalsIgnoreCase(login))
                notificationsReturn.add(notification);
        return notificationsReturn;
    }

    @Transactional
    public List<List<String>> find(List<GAVPresentation> gavPresentationList){
        List<Student> students = studentDao.findAll();
        List<List<String>> returnStatement = new ArrayList<List<String>>();

        ArrayList<String> row = new ArrayList<String>();
        row.add("Name");
        row.add("Login");
        for(GAVPresentation gavPresentation : gavPresentationList)
            if (gavPresentation.isShow())
                row.add(gavPresentation.getAttribute());
        returnStatement.add(row);

        for(Student student : students){
            Set<Value> valueSet = student.getValues();
            boolean isSuitable = true;
            for(Value value : valueSet){
                for(GAVPresentation gavPresentation : gavPresentationList){
                    if (value.getAttribute().getAttributeName().equalsIgnoreCase(gavPresentation.getAttribute())
                            && gavPresentation.getValue() != null
                            && !gavPresentation.getValue().equalsIgnoreCase("")
                            && !value.getValue().equalsIgnoreCase(gavPresentation.getValue())) {
                        isSuitable = false;
                        break;
                    }
                    if (!isSuitable)
                        break;
                }
                if(!isSuitable)
                    break;
            }

            if (isSuitable){
                ArrayList<String> addStatement = new ArrayList<String>();
                addStatement.add(student.getSecondName() + " " + student.getFirstName());
                addStatement.add(student.getLogin());
                for(GAVPresentation gavPresentation : gavPresentationList){
                    List<GAVPresentation> valuesGAV = getValues(student.getLogin());
                    for(GAVPresentation gavStudent : valuesGAV){
                        if (gavStudent.getAttribute().equalsIgnoreCase(gavPresentation.getAttribute()) && gavPresentation.isShow()){
                            addStatement.add(gavStudent.getValue());
                            break;
                        }
                    }
                }
                returnStatement.add(addStatement);
            }
        }

        if (returnStatement.size() == 0)
            return null;

        return returnStatement;
    }

    @Transactional
    public List<List<String>> getStudentValuesInTable(List<GAVPresentation> gavPresentationList, String login){
        Student student = studentDao.findByLogin(login);
        List<List<String>> returnStatement = new ArrayList<List<String>>();
        ArrayList<String> row0 = new ArrayList<String>();
        row0.add("Attribute");
        row0.add("Value");
        returnStatement.add(row0);
        ArrayList<String> row = new ArrayList<String>();
        row.add("Name");
        row.add(student.getFirstName() + " " + student.getSecondName());
        returnStatement.add(row);
        ArrayList<String> row2 = new ArrayList<String>();
        row2.add("Login");
        row2.add(student.getLogin());
        returnStatement.add(row2);
        for(GAVPresentation gavPresentation : gavPresentationList){
            List<GAVPresentation> valuesGAV = getValues(student.getLogin());
            for(GAVPresentation gavStudent : valuesGAV){
                if (gavStudent.getAttribute().equalsIgnoreCase(gavPresentation.getAttribute()) && gavPresentation.isShow()){
                    ArrayList<String>addStatement = new ArrayList<String>();
                    addStatement.add(gavPresentation.getAttribute());
                    addStatement.add(gavStudent.getValue());
                    returnStatement.add(addStatement);
                    break;
                }
            }
        }
        return returnStatement;
    }

    @Transactional
    public List<Student> getAllDisabledStudents(){
        List<Student> students = studentDao.findAll();
        List<Student> studentsRet = new ArrayList<Student>();
        for(Student student : students)
            if(!student.isEnabled())
                studentsRet.add(student);
        return studentsRet;
    }

    /**
     * Live search method
     *
     * @param line Search line
     * @param status 0 for disabled 1 for enabled 2 for all
     * @param numberOfResults number of results to return
     * @return null if none, List<Student> if found
     */
    @Transactional
    public List<Student> liveSearch(String line, int status, int numberOfResults){
        List<Student> search = new ArrayList<Student>();
        List<Student> students = null;
        switch (status){
            case DISABLED:
                students = getAllDisabledStudents();
                break;
            case ENABLED:
                students = getAllEnabledStudents();
            case ALL:
                students = getAllEnabledStudents();
                students.addAll(getAllDisabledStudents());
                break;
            default:
                break;
        }
        if (students == null)
            return null;

        String[] initials = line.split("[ ,\\.:;]+");
        for(Student student : students){
            if (search.size() == numberOfResults)
                break;
            switch (initials.length){
                case 1:
                    if (student.getFirstName().startsWith(initials[0])
                           || student.getSecondName().startsWith(initials[0]))
                        search.add(student);
                    break;
                case 2:
                    if (student.getFirstName().startsWith(initials[0])
                            && student.getSecondName().startsWith(initials[1])
                            || student.getFirstName().startsWith(initials[1])
                            && student.getSecondName().startsWith(initials[0]))
                        search.add(student);
                        break;
                default:
                    break;
            }
        }

        return search;
    }
}

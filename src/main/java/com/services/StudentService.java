package com.services;

import com.forView.JSONStudent;
import com.services.presentation.GAVPresentation;
import org.json.JSONArray;
import org.json.JSONObject;
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

    @Autowired
    private TechnologyDao technologyDao;

    @Transactional
    public Student getStudentByLogin(String login) {
        return studentDao.findByLogin(login);
    }

    /**
     * Returns all enabled students
     *
     * @return List<Student>
     */
    @Transactional
    public List<Student> getAllEnabledStudents() {
        List<Student> students = studentDao.findAll();
        List<Student> studentsRet = new ArrayList<Student>();
        for (Student student : students)
            if (student.isEnabled())
                studentsRet.add(student);
        return studentsRet;
    }

    @Transactional
    public String getStatus(String login) {
        Set<Value> values = attributeDao.findByName("status").getValues();
        for (Value value : values)
            if (value.getStudent().getLogin().equalsIgnoreCase(login))
                return value.getValue();
        return null;
    }

    @Transactional
    public void setStatus(String studentLogin, String status) {
        Set<Value> values = attributeDao.findByName("status").getValues();
        for (Value value : values) {
            if (value.getStudent().getLogin().equalsIgnoreCase(studentLogin)) {
                value.setValue(status);
                break;
            }
        }
        attributeDao.update(attributeDao.findByName("status"));
    }

    @Transactional
    public String getFirstName(String login) {
        return studentDao.findByLogin(login).getFirstName();
    }

    @Transactional
    public String getSecondName(String login) {
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
        student.setPassword(UserService.stringToSha256(password));
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
     * @param gavList      - ArrayList of GAVPresentation
     */
    @Transactional
    public void setValues(String studentLogin, List<GAVPresentation> gavList) {
        Student student = studentDao.findByLogin(studentLogin);
        for (GAVPresentation gav : gavList) {
            Set<Value> values = attributeDao.findByName(gav.getAttribute()).getValues();
            boolean edited = false;
            for (Value value : values) {
                if (value.getStudent().getLogin().equalsIgnoreCase(studentLogin)) {
                    edited = true;
                    value.setValue("");
                    if (gav.getValues() == null)
                        value.setValue(gav.getValue());
                    else
                        for (String v : gav.getValues())
                            value.setValue(value.getValue() + ";" + v);
                    break;
                }
            }
            if (!edited) {
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
        for (Value valera : valuesS) {
            if (valera.getStudent().getLogin().equalsIgnoreCase(studentLogin)) {
                status = valera.getValue();
                break;
            }
        }

        List<Group> groups = groupDao.getByStatus(status);
        List<GAVPresentation> gavs = new ArrayList<GAVPresentation>();
        for (Group group : groups) {
            Set<Attribute> attributes = group.getAttributes();
            for (Attribute attribute : attributes) {
                Set<Value> values = attribute.getValues();
                GAVPresentation gav = new GAVPresentation();
                gav.setGroup(group.getName());
                gav.setAttribute(attribute.getAttributeName());
                gav.setType(attribute.getType());
                gav.setPossibleValues(attribute.getPossibleValues());
                gav.setValue("");
                for (Value value : values) {
                    if (value.getStudent().getLogin().equalsIgnoreCase(studentLogin)) {
                        if (value.getAttribute().getType().equalsIgnoreCase("list"))
                            gav.setValues(value.getValue());
                        else
                            gav.setValue(value.getValue());
                    }
                }
                gavs.add(gav);
            }
        }

        Collections.sort(gavs);
        return gavs;
    }

    @Transactional
    public void addWorkingReview(String studentLogin, String feedbackerLogin, Review review) {
        review.setFeedbacker(feedbackerDao.findByLogin(feedbackerLogin));
        review.setStudent(studentDao.findByLogin(studentLogin));
        review.setDate(Calendar.getInstance());

        reviewDao.save(review);
    }

    @Transactional
    public void addStudyingReview(String studentLogin, String feedbackerLogin, Review review) {
        review.setFeedbacker(feedbackerDao.findByLogin(feedbackerLogin));
        review.setStudent(studentDao.findByLogin(studentLogin));
        review.setDate(Calendar.getInstance());
        List<Rating> ratings = new ArrayList<Rating>();
        ratings.addAll(review.getRatings());
        System.out.println("+++++++++++++++" + review.getRatings().size());
        review.getRatings().clear();
        reviewDao.save(review);
        for (Rating rating : ratings) {
            Technology technology = technologyDao.findByName(rating.getTechnology().getTechnologyName());
            rating.setTechnology(technology);
            rating.setReview(review);
            technology.getRatings().add(rating);
            technologyDao.update(technology);
            System.out.println("Ya ALESHA!");
        }
    }

    /**
     * Add Interviewer for a student
     *
     * @param interviewerLogin - Interviewer's login
     * @param studentLogin     - - Student's login
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
     * @param studentLogin     - Student's login
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
    public List<Review> getReviews(String login) {
        List<Review> reviews = reviewDao.findAll();
        List<Review> rev = new ArrayList<Review>();
        for (Review review : reviews)
            if (review.getStudent().getLogin().equalsIgnoreCase(login))
                rev.add(review);
        return rev;
    }

    @Transactional
    public Review getLastReview(String login) {
        Set<Review> reviews = studentDao.findByLogin(login).getReviews();
        Review r = null;
        for (Review review : reviews) {
            if (r == null)
                r = review;
            else if (r.getDate().before(review.getDate()))
                r = review;
        }
        return r;
    }

    @Transactional
    public List<List<String>> find(List<GAVPresentation> gavPresentationList) {
        List<Student> students = getAllEnabledStudents();
        List<List<String>> returnStatement = new ArrayList<List<String>>();

        ArrayList<String> row = new ArrayList<String>();
        row.add("Name");
        row.add("Login");
        for (GAVPresentation gavPresentation : gavPresentationList)
            if (gavPresentation.isShow())
                row.add(gavPresentation.getAttribute());
        returnStatement.add(row);

        List<Student> students1 = new ArrayList<Student>();
        for (GAVPresentation gavPresentation : gavPresentationList) {

            boolean isAttrEmpty = false;
            if (gavPresentation.getValue() == null)
                isAttrEmpty = true;
            else if (gavPresentation.getValue().equals(""))
                isAttrEmpty = true;
            if (!isAttrEmpty) {

                students1.clear();
                students1.addAll(students);
                students.clear();
                for (Student student : students1) {

                    boolean isSuitable = false;
                    Set<Value> valueSet = student.getValues();
                    for (Value value : valueSet) {
                        if (value != null) {
                            if (value.getAttribute().getAttributeName().equalsIgnoreCase(gavPresentation.getAttribute()) &&
                                    value.getValue().equalsIgnoreCase(gavPresentation.getValue())) {
                                isSuitable = true;
                                break;
                            }
                        }
                        if (isSuitable)
                            break;
                    }
                    if (isSuitable)
                        students.add(student);
                }
            }
        }
        for (Student student : students) {
            ArrayList<String> addStatement = new ArrayList<String>();
            addStatement.add(student.getSecondName() + " " + student.getFirstName());
            addStatement.add(student.getLogin());
            for (GAVPresentation gavPresentation : gavPresentationList) {
                if (gavPresentation.isShow()) {
                    List<GAVPresentation> valuesGAV = getValues(student.getLogin());
                    boolean foundAttribute = false;
                    for (GAVPresentation gavStudent : valuesGAV) {
                        if (gavStudent.getAttribute().equalsIgnoreCase(gavPresentation.getAttribute())) {
                            addStatement.add(gavStudent.getValue());
                            foundAttribute = true;
                            break;
                        }
                    }
                    if (!foundAttribute)
                        addStatement.add("");
                }
            }
            returnStatement.add(addStatement);
        }

        if (returnStatement.size() == 0)
            return null;

        return returnStatement;
    }

    @Transactional
    public List<List<String>> getStudentValuesInTable(List<GAVPresentation> gavPresentationList, String login) {
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
        for (GAVPresentation gavPresentation : gavPresentationList) {
            List<GAVPresentation> valuesGAV = getValues(student.getLogin());
            for (GAVPresentation gavStudent : valuesGAV) {
                if (gavStudent.getAttribute().equalsIgnoreCase(gavPresentation.getAttribute()) && gavPresentation.isShow()) {
                    ArrayList<String> addStatement = new ArrayList<String>();
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
    public List<Student> getAllDisabledStudents() {
        List<Student> students = studentDao.findAll();
        List<Student> studentsRet = new ArrayList<Student>();
        for (Student student : students)
            if (!student.isEnabled())
                studentsRet.add(student);
        return studentsRet;
    }

    /**
     * Live search method
     *
     * @param line            Search line
     * @param numberOfResults number of results to return
     * @return null if none, List<Student> if found
     */
    @Transactional
    public List<JSONStudent> liveSearch(String line, int numberOfResults) {
        List<Student> students = getAllEnabledStudents();
        if (students == null)
            return null;

        List<JSONStudent> jsonStudents = new ArrayList ();
        String[] initials = line.split("[ ,\\.:;]+");
        for (Student student : students) {
            if (jsonStudents.size() == numberOfResults)
                break;
            switch (initials.length) {
                case 1:
                    if (student.getFirstName().toLowerCase().startsWith(initials[0].toLowerCase())
                            || student.getSecondName().toLowerCase().startsWith(initials[0].toLowerCase())) {
                        JSONStudent jsonStudent = new JSONStudent();
                        jsonStudent.setLogin(student.getLogin());
                        jsonStudent.setFirstName(student.getFirstName());
                        jsonStudent.setSecondName(student.getSecondName());
                        jsonStudents.add(jsonStudent);
                    }
                    break;
                case 2:
                    if (student.getFirstName().toLowerCase().startsWith(initials[0].toLowerCase())
                            && student.getSecondName().toLowerCase().startsWith(initials[1].toLowerCase())
                            || student.getFirstName().toLowerCase().startsWith(initials[1].toLowerCase())
                            && student.getSecondName().toLowerCase().startsWith(initials[0].toLowerCase())) {
                        JSONStudent jsonStudent = new JSONStudent();
                        jsonStudent.setLogin(student.getLogin());
                        jsonStudent.setFirstName(student.getFirstName());
                        jsonStudent.setSecondName(student.getSecondName());
                        jsonStudents.add(jsonStudent);
                    }
                    break;
                default:
                    break;
            }
        }

        return jsonStudents;
    }
}

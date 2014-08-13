package com.forView;

import java.util.List;

/**
 * Created by Надя on 04.08.2014.
 */
public class CreateNotifUnit {
    private List<String> feedbackers;
    private List<String> students;
    private List<String> workers;
    private boolean forStudents;
    private boolean forFeedbackers;
    private boolean forWorkers;
    private String title;
    private String text;
    private String sender;
    private String password;

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isForStudents() {
        return forStudents;
    }

    public void setForStudents(boolean forStudents) {
        this.forStudents = forStudents;
    }

    public boolean isForFeedbackers() {
        return forFeedbackers;
    }

    public void setForFeedbackers(boolean forFeedbackers) {
        this.forFeedbackers = forFeedbackers;
    }

    public boolean isForWorkers() {
        return forWorkers;
    }

    public void setForWorkers(boolean forWorkers) {
        this.forWorkers = forWorkers;
    }

    public List<String> getFeedbackers() {
        return feedbackers;
    }

    public void setFeedbackers(List<String> feedbackers) {
        this.feedbackers = feedbackers;
    }

    public List<String> getStudents() {
        return students;
    }

    public void setStudents(List<String> students) {
        this.students = students;
    }

    public List<String> getWorkers() {
        return workers;
    }

    public void setWorkers(List<String> workers) {
        this.workers = workers;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

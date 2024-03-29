package com.forView;

import java.util.List;

/**
 * Created by Надя on 30.07.2014.
 */
public class LinkUnit {

    private List<String> students;
    private List<String> feedbackers;
    private boolean curator;//or Interviewer
    private String technology;

    public List<String> getStudents() {
        return students;
    }

    public void setStudents(List<String> students) {
        this.students = students;
    }

    public List<String> getFeedbackers() {
        return feedbackers;
    }

    public void setFeedbackers(List<String> feedbackers) {
        this.feedbackers = feedbackers;
    }

    public boolean isCurator() {
        return curator;
    }

    public void setCurator(boolean curator) {
        this.curator = curator;
    }


    public String getTechnology() {
        return technology;
    }

    public void setTechnology(String technology) {
        this.technology = technology;
    }





}

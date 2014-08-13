package com.forView;

import java.util.List;

/**
 * Created by Надя on 12.08.2014.
 */
public class UnlinkUnit {
    private List<String> curators;
    private List<String> interviewers;
    private String student;

    public List<String> getCurators() {
        return curators;
    }

    public void setCurators(List<String> curators) {
        this.curators = curators;
    }

    public List<String> getInterviewers() {
        return interviewers;
    }

    public void setInterviewers(List<String> interviewers) {
        this.interviewers = interviewers;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }
}

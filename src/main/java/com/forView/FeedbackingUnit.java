package com.forView;

/**
 * Created by Надя on 30.07.2014.
 */
public class FeedbackingUnit {


    private String studentLogin;
    private String studentName;
    private String date;
    private String feedbackerName;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getFeedbackerName() {
        return feedbackerName;
    }

    public void setFeedbackerName(String feedbackerName) {
        this.feedbackerName = feedbackerName;
    }


    public String getStudentLogin() {
        return studentLogin;
    }

    public void setStudentLogin(String studentLogin) {
        this.studentLogin = studentLogin;
    }

}

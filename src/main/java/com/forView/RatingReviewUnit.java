package com.forView;

import persistance.model.Review;

/**
 * Created by Надя on 05.08.2014.
 */
public class RatingReviewUnit {
    private String tech1;
    private String tech2;
    private String tech3;
    private String tech4;
    private String english;
    private String other;
    private Short rating1;
    private Short rating2;
    private Short rating3;
    private Short rating4;
    private Short ratingEnglish;
    private Review review;

    public Review getReview() {
        return review;
    }

    public void setReview(Review review) {
        this.review = review;
    }

    public String getTech1() {
        return tech1;
    }

    public void setTech1(String tech1) {
        this.tech1 = tech1;
    }

    public String getTech2() {
        return tech2;
    }

    public void setTech2(String tech2) {
        this.tech2 = tech2;
    }

    public String getTech3() {
        return tech3;
    }

    public void setTech3(String tech3) {
        this.tech3 = tech3;
    }

    public String getTech4() {
        return tech4;
    }

    public void setTech4(String tech4) {
        this.tech4 = tech4;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public Short getRating1() {
        return rating1;
    }

    public void setRating1(Short rating1) {
        this.rating1 = rating1;
    }

    public Short getRating2() {
        return rating2;
    }

    public void setRating2(Short rating2) {
        this.rating2 = rating2;
    }

    public Short getRating3() {
        return rating3;
    }

    public void setRating3(Short rating3) {
        this.rating3 = rating3;
    }

    public Short getRating4() {
        return rating4;
    }

    public void setRating4(Short rating4) {
        this.rating4 = rating4;
    }

    public Short getRatingEnglish() {
        return ratingEnglish;
    }

    public void setRatingEnglish(Short ratingEnglish) {
        this.ratingEnglish = ratingEnglish;
    }
}

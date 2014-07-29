package com.View;

import com.services.presentation.GAVPresentation;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Надя on 29.07.2014.
 */
public class Group {
    private List<GAVPresentation> group;

    public Group(){
        group = new ArrayList<GAVPresentation>();
    }

    public Group(int size){
        group = new ArrayList<GAVPresentation>(size);
    }

    public List<GAVPresentation> getGroup() {
        return group;
    }

    public void setGroup(List<GAVPresentation> group) {
        this.group = group;
    }
}

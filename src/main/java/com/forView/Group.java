package com.forView;

import com.services.presentation.GAVPresentation;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Надя on 29.07.2014.
 */
public class Group {
    private List<GAVPresentation> gavs;

    public Group(){
        gavs = new ArrayList<GAVPresentation>();
    }

    public Group(int size){
        gavs = new ArrayList<GAVPresentation>(size);
    }

    public List<GAVPresentation> getGavs() {
        return gavs;
    }

    public void setGavs(List<GAVPresentation> gavs) {
        this.gavs = gavs;
    }
}

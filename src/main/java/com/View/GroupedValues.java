package com.View;

import com.services.presentation.GAVPresentation;

import java.util.ArrayList;

/**
 * Created by Надя on 28.07.2014.
 */
public class GroupedValues {
    private ArrayList<ArrayList<GAVPresentation>> valuesArray;
    private GAVPresentation[] test;

    public GroupedValues(){
        valuesArray = new ArrayList<ArrayList<GAVPresentation>>();
        /*setTest(new GAVPresentation[2]);
        getTest()[0].setValue("1");
        getTest()[1].setValue("2");*/
    }

    public ArrayList<ArrayList<GAVPresentation>> getValuesArray() {
        return valuesArray;
    }

    public void setValuesArray(ArrayList<ArrayList<GAVPresentation>> valuesArray) {
        this.valuesArray = valuesArray;
    }

    public GAVPresentation[] getTest() {
        return test;
    }

    public void setTest(GAVPresentation[] test) {
        this.test = test;
    }
}

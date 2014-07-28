package com.View;

import com.services.presentation.GAVPresentation;

/**
 * Created by Надя on 28.07.2014.
 */
public class GroupedValues {
    private GAVPresentation[][] valuesArray;
    private GAVPresentation[] test;

    public GroupedValues(){
        valuesArray = new GAVPresentation[4][4];
        /*setTest(new GAVPresentation[2]);
        getTest()[0].setValue("1");
        getTest()[1].setValue("2");*/
    }


    public GAVPresentation[] getTest() {
        return test;
    }

    public void setTest(GAVPresentation[] test) {
        this.test = test;
    }

    public GAVPresentation[][] getValuesArray() {
        return valuesArray;
    }

    public void setValuesArray(GAVPresentation[][] valuesArray) {
        this.valuesArray = valuesArray;
    }
}

package com.View;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Надя on 28.07.2014.
 */
public class GroupedValues {
    private List<Group> valuesArray;

    public GroupedValues(){
        valuesArray = new ArrayList<Group>();
    }

    public List<Group> getValuesArray() {
        return valuesArray;
    }

    public void setValuesArray(List<Group> valuesArray) {
        this.valuesArray = valuesArray;
    }
}

package com.services.presentation;

import java.util.ArrayList;
import java.util.List;

public class GAVPresentation {

    private String group;
    private String attribute;
    private String value;
    private String type;
    private List<String> possibleValues;
    private boolean show;

    public static List<String> parse(String line){
        String[] values = line.split("[,;( ,)]+");
        ArrayList<String> valuesList = new ArrayList<String>();
        for(String str : values)
            valuesList.add(str);
        return valuesList;
    }

    public void setPossibleValues(List<String> list){
        possibleValues.addAll(list);
    }

    public List<String> getPossibleValues(){
        return possibleValues;
    }

    public boolean isShow() {
        return show;
    }

    public void setShow(boolean show) {
        this.show = show;
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}

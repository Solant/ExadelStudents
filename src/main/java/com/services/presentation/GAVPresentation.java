package com.services.presentation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GAVPresentation implements Comparable<GAVPresentation>{

    private String group;
    private String attribute;
    private String value;
    private String type;
    private List<String> values;
    private List<String> possibleValues;
    private boolean show;

    private List<String> parse(String line){
        if(line == null || line.equals(""))
            return null;

        String[] values = line.split("[,;(, )]+");
        ArrayList<String> valuesList = new ArrayList<String>();
        Collections.addAll(valuesList, values);
        return valuesList;
    }

    public void setValues(String line){
        values = parse(line);
    }

    public List<String> getValues(){
        return values;
    }

    public void setValues(List<String> list){
        this.values = list;
    }

    public void setPossibleValues(String line){
        possibleValues = parse(line);
    }

    public void setPossibleValues(List<String> list){
        this.possibleValues = list;
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

    @Override
    public int compareTo(GAVPresentation gavPresentation) {
        return this.getAttribute().compareTo(gavPresentation.getAttribute());
    }
}

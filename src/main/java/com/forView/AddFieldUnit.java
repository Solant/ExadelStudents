package com.forView;

/**
 * Created by Надя on 05.08.2014.
 */
public class AddFieldUnit {
    private String groupName;
    private String fieldName;
    private String type;
    private String possibleValues;
    private boolean existingGroup;
    private String forStatus;

    public String getForStatus() {
        return forStatus;
    }

    public void setForStatus(String forStatus) {
        this.forStatus = forStatus;
    }

    public boolean isExistingGroup() {
        return existingGroup;
    }

    public void setExistingGroup(boolean existingGroup) {
        this.existingGroup = existingGroup;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPossibleValues() {
        return possibleValues;
    }

    public void setPossibleValues(String possibleValues) {
        this.possibleValues = possibleValues;
    }
}

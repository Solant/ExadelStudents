package com.forView;

/**
 * Created by Надя on 05.08.2014.
 */
public class AddFieldUnit {
    private String groupNameExist;
    private String groupNameNew;
    private String fieldName;
    private String type;
    private String possibleValues;
    private boolean existingGroup;
    private String forStatus;
    private String valueType;


    public String getGroupNameNew() {
        return groupNameNew;
    }

    public void setGroupNameNew(String groupNameNew) {
        this.groupNameNew = groupNameNew;
    }


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

    public String getGroupNameExist() {
        return groupNameExist;
    }

    public void setGroupNameExist(String groupNameExist) {
        this.groupNameExist = groupNameExist;
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

    public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }
}

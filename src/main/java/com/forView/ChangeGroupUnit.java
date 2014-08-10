package com.forView;

public class ChangeGroupUnit {
    private String oldGroupName;
    private String newGroupName;
    private boolean delete;
    private String status;

    public String getOldGroupName() {
        return oldGroupName;
    }

    public void setOldGroupName(String oldGroupName) {
        this.oldGroupName = oldGroupName;
    }

    public String getNewGroupName() {
        return newGroupName;
    }

    public void setNewGroupName(String newGroupName) {
        this.newGroupName = newGroupName;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

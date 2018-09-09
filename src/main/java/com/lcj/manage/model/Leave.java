package com.lcj.manage.model;

import java.util.Date;

public class Leave {
    private int l_id;
    private int u_id;
    private String reason;
    private String description;
    private Date leave_date;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getL_id() {
        return l_id;
    }

    public void setL_id(int l_id) {
        this.l_id = l_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getLeave_date() {
        return leave_date;
    }

    public void setLeave_date(Date leave_date) {
        this.leave_date = leave_date;
    }
}

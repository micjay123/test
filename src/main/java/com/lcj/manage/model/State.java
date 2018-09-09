package com.lcj.manage.model;

public class State {
    private int id;
    private String s_name;
    private int u_id;
    private String s_description;

    @Override
    public String toString() {
        return "State{" +
                "s_name='" + s_name + '\'' +
                ", u_id=" + u_id +
                ", s_description='" + s_description + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getS_description() {
        return s_description;
    }

    public void setS_description(String s_description) {
        this.s_description = s_description;
    }
}

package com.lcj.manage.model;

public class Right {
    private int id ;
    private String q_name;
    private String q_description;
    private int r_code;

    @Override
    public String toString() {
        return "Right{" +
                "id=" + id +
                ", q_name='" + q_name + '\'' +
                ", q_description='" + q_description + '\'' +
                ", r_code=" + r_code +
                '}';
    }

    public int getR_code() {
        return r_code;
    }

    public void setR_code(int r_code) {
        this.r_code = r_code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQ_name() {
        return q_name;
    }

    public void setQ_name(String q_name) {
        this.q_name = q_name;
    }

    public String getQ_description() {
        return q_description;
    }

    public void setQ_description(String q_description) {
        this.q_description = q_description;
    }
}

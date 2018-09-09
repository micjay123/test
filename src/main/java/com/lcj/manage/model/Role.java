package com.lcj.manage.model;

public class Role {
    private int id;
    private String r_name;
    private  int q_id;
    private  String r_description;
    private  int r_code;
    private  Right right;

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", r_name='" + r_name + '\'' +
                ", q_id=" + q_id +
                ", r_description='" + r_description + '\'' +
                ", r_code=" + r_code +
                ", right=" + right +
                '}';
    }

    public Right getRight() {
        return right;
    }

    public void setRight(Right right) {
        this.right = right;
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

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public String getR_description() {
        return r_description;
    }

    public void setR_description(String r_description) {
        this.r_description = r_description;
    }
}

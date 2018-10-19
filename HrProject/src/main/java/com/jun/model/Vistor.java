package com.jun.model;

import java.io.Serializable;

public class Vistor implements Serializable {
    private int v_id;
    private String v_name;
    private String v_pass;

    public Vistor() {
    }

    @Override
    public String toString() {
        return "Vistor{" +
                "v_id=" + v_id +
                ", v_name='" + v_name + '\'' +
                ", v_pass='" + v_pass + '\'' +
                '}';
    }

    public int getV_id() {
        return v_id;
    }

    public void setV_id(int v_id) {
        this.v_id = v_id;
    }

    public String getV_name() {
        return v_name;
    }

    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    public String getV_pass() {
        return v_pass;
    }

    public void setV_pass(String v_pass) {
        this.v_pass = v_pass;
    }
}

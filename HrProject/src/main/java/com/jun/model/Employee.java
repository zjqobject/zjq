package com.jun.model;

import java.util.Date;

public class Employee {
    private int em_id;
    private String em_acount;
    private String em_pass;
    private  String em_position;
    private Date em_indate;
    private String em_salary;
    private String em_department;

    public int getEm_id() {
        return em_id;
    }

    public void setEm_id(int em_id) {
        this.em_id = em_id;
    }

    public String getEm_acount() {
        return em_acount;
    }

    public void setEm_acount(String em_acount) {
        this.em_acount = em_acount;
    }

    public String getEm_pass() {
        return em_pass;
    }

    public void setEm_pass(String em_pass) {
        this.em_pass = em_pass;
    }

    public String getEm_position() {
        return em_position;
    }

    public void setEm_position(String em_position) {
        this.em_position = em_position;
    }

    public Date getEm_indate() {
        return em_indate;
    }

    public void setEm_indate(Date em_indate) {
        this.em_indate = em_indate;
    }

    public String getEm_salary() {
        return em_salary;
    }

    public void setEm_salary(String em_salary) {
        this.em_salary = em_salary;
    }

    public String getEm_department() {
        return em_department;
    }

    public void setEm_department(String em_department) {
        this.em_department = em_department;
    }
}

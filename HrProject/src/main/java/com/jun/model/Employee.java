package com.jun.model;

import java.util.Date;

public class Employee {
    private int em_id;
    private String em_acount;
    private String em_pass;
    private  int em_poid;
    private Date em_indate;
    private int em_salary;
    private String em_phone;
    private String em_sex;
    private int em_status;
    private String em_position;
    private String em_department;

    public String getEm_position() {
        return em_position;
    }

    public void setEm_position(String em_position) {
        this.em_position = em_position;
    }

    public String getEm_department() {
        return em_department;
    }

    public void setEm_department(String em_department) {
        this.em_department = em_department;
    }

    public Employee() {
    }

    public int getEm_poid() {
        return em_poid;
    }

    public void setEm_poid(int em_poid) {
        this.em_poid = em_poid;
    }

    public String getEm_acount() {
        return em_acount;
    }

    public void setEm_acount(String em_acount) {
        this.em_acount = em_acount;
    }

    public String getEm_phone() {
        return em_phone;
    }

    public void setEm_phone(String em_phone) {
        this.em_phone = em_phone;
    }

    public String getEm_sex() {
        return em_sex;
    }

    public void setEm_sex(String em_sex) {
        this.em_sex = em_sex;
    }

    public int getEm_status() {
        return em_status;
    }

    public void setEm_status(int em_status) {
        this.em_status = em_status;
    }

    public int getEm_id() {
        return em_id;
    }

    public void setEm_id(int em_id) {
        this.em_id = em_id;
    }


    public String getEm_pass() {
        return em_pass;
    }

    public void setEm_pass(String em_pass) {
        this.em_pass = em_pass;
    }

    public Date getEm_indate() {
        return em_indate;
    }

    public void setEm_indate(Date em_indate) {
        this.em_indate = em_indate;
    }

    public int getEm_salary() {
        return em_salary;
    }

    public void setEm_salary(int em_salary) {
        this.em_salary = em_salary;
    }
}

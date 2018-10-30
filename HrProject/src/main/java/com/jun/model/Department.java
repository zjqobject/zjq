package com.jun.model;

import java.util.Date;

public class Department {
    private  int de_id;
    private  String de_name;
    private Date de_createdate;

    public Date getDe_createdate() {
        return de_createdate;
    }

    public void setDe_createdate(Date de_createdate) {
        this.de_createdate = de_createdate;
    }

    public int getDe_id() {
        return de_id;
    }

    public void setDe_id(int de_id) {
        this.de_id = de_id;
    }

    public String getDe_name() {
        return de_name;
    }

    public void setDe_name(String de_name) {
        this.de_name = de_name;
    }
}

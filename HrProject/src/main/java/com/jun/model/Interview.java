package com.jun.model;

import java.util.Date;

public class Interview {
    private int iv_id;
    private int iv_invit;
    private int iv_vid;
    private int iv_reid;
    private int iv_receive;
    private int iv_rid;
    private Date iv_date;
    private Date iv_offerDate;
    private int iv_offerid;
    private String iv_vname;
    private String iv_poname;

    public String getIv_vname() {
        return iv_vname;
    }

    public void setIv_vname(String iv_vname) {
        this.iv_vname = iv_vname;
    }

    public String getIv_poname() {
        return iv_poname;
    }

    public void setIv_poname(String iv_poname) {
        this.iv_poname = iv_poname;
    }

    public int getIv_reid() {
        return iv_reid;
    }

    public void setIv_reid(int iv_reid) {
        this.iv_reid = iv_reid;
    }

    public Date getIv_offerDate() {
        return iv_offerDate;
    }

    public void setIv_offerDate(Date iv_offerDate) {
        this.iv_offerDate = iv_offerDate;
    }

    public int getIv_offerid() {
        return iv_offerid;
    }

    public void setIv_offerid(int iv_offerid) {
        this.iv_offerid = iv_offerid;
    }

    public Date getIv_date() {
        return iv_date;
    }

    public void setIv_date(Date iv_date) {
        this.iv_date = iv_date;
    }

    public int getIv_rid() {
        return iv_rid;
    }

    public void setIv_rid(int iv_rid) {
        this.iv_rid = iv_rid;
    }

    public int getIv_receive() {
        return iv_receive;
    }

    public void setIv_receive(int iv_receive) {
        this.iv_receive = iv_receive;
    }

    public Interview() {
    }

    public int getIv_id() {
        return iv_id;
    }

    public void setIv_id(int iv_id) {
        this.iv_id = iv_id;
    }

    public int getIv_invit() {
        return iv_invit;
    }

    public void setIv_invit(int iv_invit) {
        this.iv_invit = iv_invit;
    }

    public int getIv_vid() {
        return iv_vid;
    }

    public void setIv_vid(int iv_vid) {
        this.iv_vid = iv_vid;
    }
}


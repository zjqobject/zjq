package com.jun.model;

public class Interview {
    private int iv_id;
    private int iv_invit;
    private String iv_vname;
    private String  iv_rename;
    private int iv_receive;
    private int iv_rid;

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

    public String getIv_vname() {
        return iv_vname;
    }

    public void setIv_vname(String iv_vname) {
        this.iv_vname = iv_vname;
    }

    public String getIv_rename() {
        return iv_rename;
    }

    public void setIv_rename(String iv_rename) {
        this.iv_rename = iv_rename;
    }
}

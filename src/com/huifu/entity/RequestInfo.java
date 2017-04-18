package com.huifu.entity;

public class RequestInfo {
    private Integer id;

    private Integer userid;

    private String info;

    private Integer statusinfo;

    private String systemcode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    public Integer getStatusinfo() {
        return statusinfo;
    }

    public void setStatusinfo(Integer statusinfo) {
        this.statusinfo = statusinfo;
    }

    public String getSystemcode() {
        return systemcode;
    }

    public void setSystemcode(String systemcode) {
        this.systemcode = systemcode == null ? null : systemcode.trim();
    }
}
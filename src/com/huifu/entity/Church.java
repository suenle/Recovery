package com.huifu.entity;

public class Church {
    private Integer id;

    private String churchcode;

    private String churchname;

    private String churchaddress;

    private String churchdesc;

    private String systemcode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChurchcode() {
        return churchcode;
    }

    public void setChurchcode(String churchcode) {
        this.churchcode = churchcode == null ? null : churchcode.trim();
    }

    public String getChurchname() {
        return churchname;
    }

    public void setChurchname(String churchname) {
        this.churchname = churchname == null ? null : churchname.trim();
    }

    public String getChurchaddress() {
        return churchaddress;
    }

    public void setChurchaddress(String churchaddress) {
        this.churchaddress = churchaddress == null ? null : churchaddress.trim();
    }

    public String getChurchdesc() {
        return churchdesc;
    }

    public void setChurchdesc(String churchdesc) {
        this.churchdesc = churchdesc == null ? null : churchdesc.trim();
    }

    public String getSystemcode() {
        return systemcode;
    }

    public void setSystemcode(String systemcode) {
        this.systemcode = systemcode == null ? null : systemcode.trim();
    }
}
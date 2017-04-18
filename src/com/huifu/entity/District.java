package com.huifu.entity;

public class District {
    private Integer id;

    private String districtcode;

    private String districtname;

    private Integer churchid;

    private String districtaddress;

    private String districtdesc;

    private String systemcode;
    
    
    private String churchname;
    
    

    public String getChurchname() {
		return churchname;
	}

	public void setChurchname(String churchname) {
		this.churchname = churchname;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDistrictcode() {
        return districtcode;
    }

    public void setDistrictcode(String districtcode) {
        this.districtcode = districtcode == null ? null : districtcode.trim();
    }

    public String getDistrictname() {
        return districtname;
    }

    public void setDistrictname(String districtname) {
        this.districtname = districtname == null ? null : districtname.trim();
    }

    public Integer getChurchid() {
        return churchid;
    }

    public void setChurchid(Integer churchid) {
        this.churchid = churchid;
    }

    public String getDistrictaddress() {
        return districtaddress;
    }

    public void setDistrictaddress(String districtaddress) {
        this.districtaddress = districtaddress == null ? null : districtaddress.trim();
    }

    public String getDistrictdesc() {
        return districtdesc;
    }

    public void setDistrictdesc(String districtdesc) {
        this.districtdesc = districtdesc == null ? null : districtdesc.trim();
    }

    public String getSystemcode() {
        return systemcode;
    }

    public void setSystemcode(String systemcode) {
        this.systemcode = systemcode == null ? null : systemcode.trim();
    }
}
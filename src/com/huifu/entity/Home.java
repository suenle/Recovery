package com.huifu.entity;

public class Home {
	private Integer id;

	private String homecode;

	private String homename;

	private Integer groupid;

	private String homeaddress;

	private String homedesc;

	private String systemcode;

	private String districtname;

	private Integer districtid;

	public Integer getDistrictid() {
		return districtid;
	}

	public void setDistrictid(Integer districtid) {
		this.districtid = districtid;
	}

	public String getDistrictname() {
		return districtname;
	}

	public void setDistrictname(String districtname) {
		this.districtname = districtname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHomecode() {
		return homecode;
	}

	public void setHomecode(String homecode) {
		this.homecode = homecode == null ? null : homecode.trim();
	}

	public String getHomename() {
		return homename;
	}

	public void setHomename(String homename) {
		this.homename = homename == null ? null : homename.trim();
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress == null ? null : homeaddress.trim();
	}

	public String getHomedesc() {
		return homedesc;
	}

	public void setHomedesc(String homedesc) {
		this.homedesc = homedesc == null ? null : homedesc.trim();
	}

	public String getSystemcode() {
		return systemcode;
	}

	public void setSystemcode(String systemcode) {
		this.systemcode = systemcode == null ? null : systemcode.trim();
	}
}
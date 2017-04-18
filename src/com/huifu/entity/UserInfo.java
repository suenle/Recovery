package com.huifu.entity;

public class UserInfo {
	private Integer id;

	private Integer userid;

	private String username;

	private Integer sex;

	private Integer age;

	private Integer groupid;

	private Integer homeid;

	private Integer phone;

	private String address;

	private String emaill;

	private String systemcode;

	private String homename;

	private String groupname;
	private Integer districtid;
	private String districtname;
	private String churchname;
	private Integer churchid;

	public String getHomename() {
		return homename;
	}

	public void setHomename(String homename) {
		this.homename = homename;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

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

	public String getChurchname() {
		return churchname;
	}

	public void setChurchname(String churchname) {
		this.churchname = churchname;
	}

	public Integer getChurchid() {
		return churchid;
	}

	public void setChurchid(Integer churchid) {
		this.churchid = churchid;
	}

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public Integer getHomeid() {
		return homeid;
	}

	public void setHomeid(Integer homeid) {
		this.homeid = homeid;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getEmaill() {
		return emaill;
	}

	public void setEmaill(String emaill) {
		this.emaill = emaill == null ? null : emaill.trim();
	}

	public String getSystemcode() {
		return systemcode;
	}

	public void setSystemcode(String systemcode) {
		this.systemcode = systemcode == null ? null : systemcode.trim();
	}
}
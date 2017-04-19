package com.huifu.entity;

public class RequestInfo {
    private Integer id;

    private Integer userid;

    private String info;

    private Integer statusinfo;

    private String systemcode;
    
    private String homename;
    
    private String groupname;
    
	private String username;

	private Integer sex;

	private Integer age;

	private Integer groupid;

	private Integer homeid;
	
	
	

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
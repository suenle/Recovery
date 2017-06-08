package com.huifu.entity;

import java.util.Date;

public class LifeScore {
    private Integer id;

    private Integer userid;

    private Integer morningrevialscore;

    private Integer twoaltarprayscore;

    private Integer psrpscore;

    private Integer threeoldscore;

    private Integer onenewscore;

    private Integer personalprayscore;

    private Integer shepherdscore;

    private Integer gospelscore;

    private Integer sundayscore;

    private Integer sundayprophesy;

    private Integer praymeeting;

    private Integer groupmeeting;

    private Integer groupshare;

    private Integer psrpmeeting;

    private Integer birdseyemeeting;

    private Date starttime;

    private Date endtime;

    private Integer scoretype;

    private Integer totalscore;

    private String systemcode;
    
    
    private String userName;
    
    private String groupname;  
    
	private Integer groupid;
	
	private Integer sex;
	
	
	
	
    public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
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

    public Integer getMorningrevialscore() {
        return morningrevialscore;
    }

    public void setMorningrevialscore(Integer morningrevialscore) {
        this.morningrevialscore = morningrevialscore;
    }

    public Integer getTwoaltarprayscore() {
        return twoaltarprayscore;
    }

    public void setTwoaltarprayscore(Integer twoaltarprayscore) {
        this.twoaltarprayscore = twoaltarprayscore;
    }

    public Integer getPsrpscore() {
        return psrpscore;
    }

    public void setPsrpscore(Integer psrpscore) {
        this.psrpscore = psrpscore;
    }

    public Integer getThreeoldscore() {
        return threeoldscore;
    }

    public void setThreeoldscore(Integer threeoldscore) {
        this.threeoldscore = threeoldscore;
    }

    public Integer getOnenewscore() {
        return onenewscore;
    }

    public void setOnenewscore(Integer onenewscore) {
        this.onenewscore = onenewscore;
    }

    public Integer getPersonalprayscore() {
        return personalprayscore;
    }

    public void setPersonalprayscore(Integer personalprayscore) {
        this.personalprayscore = personalprayscore;
    }

    public Integer getShepherdscore() {
        return shepherdscore;
    }

    public void setShepherdscore(Integer shepherdscore) {
        this.shepherdscore = shepherdscore;
    }

    public Integer getGospelscore() {
        return gospelscore;
    }

    public void setGospelscore(Integer gospelscore) {
        this.gospelscore = gospelscore;
    }

    public Integer getSundayscore() {
        return sundayscore;
    }

    public void setSundayscore(Integer sundayscore) {
        this.sundayscore = sundayscore;
    }

    public Integer getSundayprophesy() {
        return sundayprophesy;
    }

    public void setSundayprophesy(Integer sundayprophesy) {
        this.sundayprophesy = sundayprophesy;
    }

    public Integer getPraymeeting() {
        return praymeeting;
    }

    public void setPraymeeting(Integer praymeeting) {
        this.praymeeting = praymeeting;
    }

    public Integer getGroupmeeting() {
        return groupmeeting;
    }

    public void setGroupmeeting(Integer groupmeeting) {
        this.groupmeeting = groupmeeting;
    }

    public Integer getGroupshare() {
        return groupshare;
    }

    public void setGroupshare(Integer groupshare) {
        this.groupshare = groupshare;
    }

    public Integer getPsrpmeeting() {
        return psrpmeeting;
    }

    public void setPsrpmeeting(Integer psrpmeeting) {
        this.psrpmeeting = psrpmeeting;
    }

    public Integer getBirdseyemeeting() {
        return birdseyemeeting;
    }

    public void setBirdseyemeeting(Integer birdseyemeeting) {
        this.birdseyemeeting = birdseyemeeting;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getScoretype() {
        return scoretype;
    }

    public void setScoretype(Integer scoretype) {
        this.scoretype = scoretype;
    }

    public Integer getTotalscore() {
        return totalscore;
    }

    public void setTotalscore(Integer totalscore) {
        this.totalscore = totalscore;
    }

    public String getSystemcode() {
        return systemcode;
    }

    public void setSystemcode(String systemcode) {
        this.systemcode = systemcode == null ? null : systemcode.trim();
    }
}
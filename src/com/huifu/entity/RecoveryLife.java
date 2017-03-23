package com.huifu.entity;

import java.util.Date;

public class RecoveryLife {
    private Integer id;

    private Integer userid;

    private String morningrevial;

    private Integer morningrevialscore;

    private String twoaltarpray;

    private Integer twoaltarprayscore;

    private String psrp;

    private Integer psrpscore;

    private String threeold;

    private Integer threeoldscore;

    private String onenew;

    private Integer onenewscore;

    private String personalpray;

    private Integer personalprayscore;

    private String shepherd;

    private Integer shepherdscore;

    private String gospel;

    private Integer gospelscore;

    private String meeting;

    private Integer meetingtype;

    private Integer meetingscore;

    private Date time;

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

    public String getMorningrevial() {
        return morningrevial;
    }

    public void setMorningrevial(String morningrevial) {
        this.morningrevial = morningrevial == null ? null : morningrevial.trim();
    }

    public Integer getMorningrevialscore() {
        return morningrevialscore;
    }

    public void setMorningrevialscore(Integer morningrevialscore) {
        this.morningrevialscore = morningrevialscore;
    }

    public String getTwoaltarpray() {
        return twoaltarpray;
    }

    public void setTwoaltarpray(String twoaltarpray) {
        this.twoaltarpray = twoaltarpray == null ? null : twoaltarpray.trim();
    }

    public Integer getTwoaltarprayscore() {
        return twoaltarprayscore;
    }

    public void setTwoaltarprayscore(Integer twoaltarprayscore) {
        this.twoaltarprayscore = twoaltarprayscore;
    }

    public String getPsrp() {
        return psrp;
    }

    public void setPsrp(String psrp) {
        this.psrp = psrp == null ? null : psrp.trim();
    }

    public Integer getPsrpscore() {
        return psrpscore;
    }

    public void setPsrpscore(Integer psrpscore) {
        this.psrpscore = psrpscore;
    }

    public String getThreeold() {
        return threeold;
    }

    public void setThreeold(String threeold) {
        this.threeold = threeold == null ? null : threeold.trim();
    }

    public Integer getThreeoldscore() {
        return threeoldscore;
    }

    public void setThreeoldscore(Integer threeoldscore) {
        this.threeoldscore = threeoldscore;
    }

    public String getOnenew() {
        return onenew;
    }

    public void setOnenew(String onenew) {
        this.onenew = onenew == null ? null : onenew.trim();
    }

    public Integer getOnenewscore() {
        return onenewscore;
    }

    public void setOnenewscore(Integer onenewscore) {
        this.onenewscore = onenewscore;
    }

    public String getPersonalpray() {
        return personalpray;
    }

    public void setPersonalpray(String personalpray) {
        this.personalpray = personalpray == null ? null : personalpray.trim();
    }

    public Integer getPersonalprayscore() {
        return personalprayscore;
    }

    public void setPersonalprayscore(Integer personalprayscore) {
        this.personalprayscore = personalprayscore;
    }

    public String getShepherd() {
        return shepherd;
    }

    public void setShepherd(String shepherd) {
        this.shepherd = shepherd == null ? null : shepherd.trim();
    }

    public Integer getShepherdscore() {
        return shepherdscore;
    }

    public void setShepherdscore(Integer shepherdscore) {
        this.shepherdscore = shepherdscore;
    }

    public String getGospel() {
        return gospel;
    }

    public void setGospel(String gospel) {
        this.gospel = gospel == null ? null : gospel.trim();
    }

    public Integer getGospelscore() {
        return gospelscore;
    }

    public void setGospelscore(Integer gospelscore) {
        this.gospelscore = gospelscore;
    }

    public String getMeeting() {
        return meeting;
    }

    public void setMeeting(String meeting) {
        this.meeting = meeting == null ? null : meeting.trim();
    }

    public Integer getMeetingtype() {
        return meetingtype;
    }

    public void setMeetingtype(Integer meetingtype) {
        this.meetingtype = meetingtype;
    }

    public Integer getMeetingscore() {
        return meetingscore;
    }

    public void setMeetingscore(Integer meetingscore) {
        this.meetingscore = meetingscore;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getSystemcode() {
        return systemcode;
    }

    public void setSystemcode(String systemcode) {
        this.systemcode = systemcode == null ? null : systemcode.trim();
    }
}
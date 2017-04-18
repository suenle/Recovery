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

    private Integer meetingscore;

    private Integer meetingtype;

    private Integer prophesyscore;

    private Date starttime;

    private Date endtime;

    private Integer scoretype;

    private Integer totalscore;

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

    public Integer getMeetingscore() {
        return meetingscore;
    }

    public void setMeetingscore(Integer meetingscore) {
        this.meetingscore = meetingscore;
    }

    public Integer getMeetingtype() {
        return meetingtype;
    }

    public void setMeetingtype(Integer meetingtype) {
        this.meetingtype = meetingtype;
    }

    public Integer getProphesyscore() {
        return prophesyscore;
    }

    public void setProphesyscore(Integer prophesyscore) {
        this.prophesyscore = prophesyscore;
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
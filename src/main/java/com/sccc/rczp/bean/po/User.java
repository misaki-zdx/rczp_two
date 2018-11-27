package com.sccc.rczp.bean.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

public class User {

    public int a = 4;

    @Id
    private Integer uid;

    private Integer aid;

    @Column(name = "uImage")
    private String uimage;

    @Column(name = "uName")
    private String uname;

    private String sex;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date birthday;

    private String intention;

    private String uabstract;

    private String upassword;

    private List<Deliverrecord> deliverrecord;

    private Admin admin;

    private Cv cv;

    public List<Deliverrecord> getDeliverrecord() {
        return deliverrecord;
    }

    public void setDeliverrecord(List<Deliverrecord> deliverrecord) {
        this.deliverrecord = deliverrecord;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Cv getCv() {
        return cv;
    }

    public void setCv(Cv cv) {
        this.cv = cv;
    }


    /**
     * @return uid
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * @param uid
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * @return aid
     */
    public Integer getAid() {
        return aid;
    }

    /**
     * @param aid
     */
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    /**
     * @return birthday
     */

    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return intention
     */
    public String getIntention() {
        return intention;
    }

    /**
     * @param intention
     */
    public void setIntention(String intention) {
        this.intention = intention;
    }

    /**
     * @return uName
     */
    public String getUname() {
        return uname;
    }

    /**
     * @param uname
     */
    public void setUname(String uname) {
        this.uname = uname;
    }

    /**
     * @return uImage
     */
    public String getUimage() {
        return uimage;
    }

    /**
     * @param uimage
     */
    public void setUimage(String uimage) {
        this.uimage = uimage;
    }

    /**
     * @return uabstract
     */
    public String getUabstract() {
        return uabstract;
    }

    /**
     * @param uabstract
     */
    public void setUabstract(String uabstract) {
        this.uabstract = uabstract;
    }

    /**
     * @return upassword
     */
    public String getUpassword() {
        return upassword;
    }

    /**
     * @param upassword
     */
    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", aid=" + aid +
                ", uimage='" + uimage + '\'' +
                ", uname='" + uname + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", intention='" + intention + '\'' +
                ", uabstract='" + uabstract + '\'' +
                ", upassword='" + upassword + '\'' +
                '}';
    }
}
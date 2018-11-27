package com.sccc.rczp.bean.po;

import javax.persistence.*;

public class Enterprise {
    @Id
    private Integer eid;

    private Integer aid;

    private String eimage;

    @Column(name = "aAbstract")
    private String aabstract;

    @Column(name = "detailInformation")
    private String detailinformation;

    private String address;

    private String email;

    @Column(name = "phoneNumber")
    private String phonenumber;

    private String ename;

    private String epassword;

    /**
     * @return eid
     */
    public Integer getEid() {
        return eid;
    }

    /**
     * @param eid
     */
    public void setEid(Integer eid) {
        this.eid = eid;
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
     * @return eimage
     */
    public String getEimage() {
        return eimage;
    }

    /**
     * @param eimage
     */
    public void setEimage(String eimage) {
        this.eimage = eimage;
    }

    /**
     * @return aAbstract
     */
    public String getAabstract() {
        return aabstract;
    }

    /**
     * @param aabstract
     */
    public void setAabstract(String aabstract) {
        this.aabstract = aabstract;
    }

    /**
     * @return detailInformation
     */
    public String getDetailinformation() {
        return detailinformation;
    }

    /**
     * @param detailinformation
     */
    public void setDetailinformation(String detailinformation) {
        this.detailinformation = detailinformation;
    }

    /**
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return phoneNumber
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * @param phonenumber
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    /**
     * @return ename
     */
    public String getEname() {
        return ename;
    }

    /**
     * @param ename
     */
    public void setEname(String ename) {
        this.ename = ename;
    }

    /**
     * @return epassword
     */
    public String getEpassword() {
        return epassword;
    }

    /**
     * @param epassword
     */
    public void setEpassword(String epassword) {
        this.epassword = epassword;
    }
}
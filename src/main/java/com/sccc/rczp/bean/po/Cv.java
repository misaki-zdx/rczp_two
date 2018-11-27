package com.sccc.rczp.bean.po;

import javax.persistence.*;

public class Cv {
    @Id
    private Integer cid;

    private Integer uid;

    @Column(name = "cv_path")
    private String cvPath;

    /**
     * @return cid
     */
    public Integer getCid() {
        return cid;
    }

    /**
     * @param cid
     */
    public void setCid(Integer cid) {
        this.cid = cid;
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
     * @return cv_path
     */
    public String getCvPath() {
        return cvPath;
    }

    /**
     * @param cvPath
     */
    public void setCvPath(String cvPath) {
        this.cvPath = cvPath;
    }
}
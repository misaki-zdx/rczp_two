package com.sccc.rczp.bean.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import javax.persistence.*;

public class Deliverrecord {
    @Id
    private Integer did;

    private Integer uid;

    private Integer rid;

    private Integer passflag;

    private Date dtime;

    private Recruitinformation recruitinformation;

    public Recruitinformation getRecruitinformation() {
        return recruitinformation;
    }

    public void setRecruitinformation(Recruitinformation recruitinformation) {
        this.recruitinformation = recruitinformation;
    }

    /**
     * @return did
     */
    public Integer getDid() {
        return did;
    }

    /**
     * @param did
     */
    public void setDid(Integer did) {
        this.did = did;
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

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPassflag() {
        return passflag;
    }

    public void setPassflag(Integer passflag) {
        this.passflag = passflag;
    }

    /**
     * @return dtime
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getDtime() {
        return dtime;
    }

    /**
     * @param dtime
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public void setDtime(Date dtime) {
        this.dtime = dtime;
    }
}
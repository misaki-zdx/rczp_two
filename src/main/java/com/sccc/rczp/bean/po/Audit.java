package com.sccc.rczp.bean.po;

import javax.persistence.*;

public class Audit {
    @Id
    private Integer auid;

    private Integer aid;

    private Integer eid;

    private Integer austate;

    /**
     * @return auid
     */
    public Integer getAuid() {
        return auid;
    }

    /**
     * @param auid
     */
    public void setAuid(Integer auid) {
        this.auid = auid;
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
     * @return austate
     */
    public Integer getAustate() {
        return austate;
    }

    /**
     * @param austate
     */
    public void setAustate(Integer austate) {
        this.austate = austate;
    }
}
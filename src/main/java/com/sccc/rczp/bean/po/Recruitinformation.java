package com.sccc.rczp.bean.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import javax.persistence.*;

public class Recruitinformation {
    @Id
    private Integer rid;

    private Integer eid;

    private String job;

    private String path;

    private Integer tid;

    private String benefit;

    private String title;

    @Column(name = "salaryMin")
    private Integer salarymin;

    @Column(name = "salaryMax")
    private Integer salarymax;

    private String jobdes;

    private String qualifications;

    private Date rtime;

    private Enterprise enterprise;

    private Type type;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }

    /**
     * @return rid
     */
    public Integer getRid() {
        return rid;
    }

    /**
     * @param rid
     */
    public void setRid(Integer rid) {
        this.rid = rid;
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
     * @return job
     */
    public String getJob() {
        return job;
    }

    /**
     * @param job
     */
    public void setJob(String job) {
        this.job = job;
    }

    /**
     * @return path
     */
    public String getPath() {
        return path;
    }

    /**
     * @param path
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     * @return benefit
     */
    public String getBenefit() {
        return benefit;
    }

    /**
     * @param benefit
     */
    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }

    /**
     * @return title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return salaryMin
     */
    public Integer getSalarymin() {
        return salarymin;
    }

    /**
     * @param salarymin
     */
    public void setSalarymin(Integer salarymin) {
        this.salarymin = salarymin;
    }

    /**
     * @return salaryMax
     */
    public Integer getSalarymax() {
        return salarymax;
    }

    /**
     * @param salarymax
     */
    public void setSalarymax(Integer salarymax) {
        this.salarymax = salarymax;
    }

    /**
     * @return qualifications
     */
    public String getQualifications() {
        return qualifications;
    }

    /**
     * @param qualifications
     */
    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    /**
     * @return rtime
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getRtime() {
        return rtime;
    }

    /**
     * @param rtime
     */
    public void setRtime(Date rtime) {
        this.rtime = rtime;
    }

    /**
     * @return jobdes
     */
    public String getJobdes() {
        return jobdes;
    }

    /**
     * @param jobdes
     */
    public void setJobdes(String jobdes) {
        this.jobdes = jobdes;
    }

    @Override
    public String toString() {
        return "Recruitinformation{" +
                "rid=" + rid +
                ", eid=" + eid +
                ", job='" + job + '\'' +
                ", path='" + path + '\'' +
                ", benefit='" + benefit + '\'' +
                ", title='" + title + '\'' +
                ", salarymin=" + salarymin +
                ", salarymax=" + salarymax +
                ", qualifications='" + qualifications + '\'' +
                ", rtime=" + rtime +
                ", jobdes='" + jobdes + '\'' +
                '}';
    }
}
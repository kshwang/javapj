package com.spring.pj.model;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelComments {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private Integer       commentno = null;     //`commentno  ` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    private Integer       bno       = null;     //`bno        `   INT(11) NOT NULL,
    private String        userid    = "";     //`userid     ` VARCHAR(50) NULL DEFAULT NULL,
    private String        memo      = "";     //`memo       ` VARCHAR(4000) NULL DEFAULT NULL,
    private java.sql.Date regdate   = null;     //`regdate    ` DATETIME NULL DEFAULT NULL,
    private Boolean       UseYN     = null;     //`UseYN      ` TINYINT(1) NULL DEFAULT '1',
    private String        InsertUID = "";     //`InsertUID  ` VARCHAR(40) NULL DEFAULT NULL,
    private java.sql.Date InsertDT  = null;     //`InsertDT   ` DATETIME NULL DEFAULT NULL,
    private String        UpdateUID = "";     //`UpdateUID  ` VARCHAR(40) NULL DEFAULT NULL,
    private java.sql.Date UpdateDT  = null;     //`UpdateDT   ` DATETIME NULL DEFAULT NULL,
    public Logger getLogger() {
        return logger;
    }
    public void setLogger(Logger logger) {
        this.logger = logger;
    }
    public Integer getCommentno() {
        return commentno;
    }
    public void setCommentno(Integer commentno) {
        this.commentno = commentno;
    }
    public Integer getBno() {
        return bno;
    }
    public void setBno(Integer bno) {
        this.bno = bno;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public java.sql.Date getRegdate() {
        return regdate;
    }
    public void setRegdate(java.sql.Date regdate) {
        this.regdate = regdate;
    }
    public Boolean getUseYN() {
        return UseYN;
    }
    public void setUseYN(Boolean useYN) {
        UseYN = useYN;
    }
    public String getInsertUID() {
        return InsertUID;
    }
    public void setInsertUID(String insertUID) {
        InsertUID = insertUID;
    }
    public java.sql.Date getInsertDT() {
        return InsertDT;
    }
    public void setInsertDT(java.sql.Date insertDT) {
        InsertDT = insertDT;
    }
    public String getUpdateUID() {
        return UpdateUID;
    }
    public void setUpdateUID(String updateUID) {
        UpdateUID = updateUID;
    }
    public java.sql.Date getUpdateDT() {
        return UpdateDT;
    }
    public void setUpdateDT(java.sql.Date updateDT) {
        UpdateDT = updateDT;
    }
    @Override
    public String toString() {
        return "ModelComments [logger=" + logger + ", commentno=" + commentno
                + ", bno=" + bno + ", userid=" + userid + ", memo=" + memo
                + ", regdate=" + regdate + ", UseYN=" + UseYN + ", InsertUID="
                + InsertUID + ", InsertDT=" + InsertDT + ", UpdateUID="
                + UpdateUID + ", UpdateDT=" + UpdateDT + "]";
    }
    public ModelComments(Integer commentno, Integer bno, String userid,
            String memo, Date regdate, Boolean useYN, String insertUID,
            Date insertDT, String updateUID, Date updateDT) {
        super();
        this.commentno = commentno;
        this.bno = bno;
        this.userid = userid;
        this.memo = memo;
        this.regdate = regdate;
        UseYN = useYN;
        InsertUID = insertUID;
        InsertDT = insertDT;
        UpdateUID = updateUID;
        UpdateDT = updateDT;
    }
    public ModelComments() {
        super();
    }
    
    
}

package com.spring.pj.model;

import java.util.Date;

public class ModelTraining {
    
    Integer articleno ;
    String  title     ; //sql하고 값 비교좀.
    String  content   ;
    String  userid    ;
    Integer hit       ;
    Date    regdate   ;
    Date    enddate   ;
    Boolean UseYN     ;
    String  InsertUID ;     
    Date    InsertDT  ;
    String  UpdateUID ;     
    Date    UpdateDT  ;
    
    //
    Integer attachFileNum;
    Integer commentNum;
    
    
    public Integer getArticleno() {
        return articleno;
    }
    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getuserid() {
        return userid;
    }
    public void setuserid(String userid) {
        this.userid = userid;
    }
    public Integer getHit() {
        return hit;
    }
    public void setHit(Integer hit) {
        this.hit = hit;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public Date getEnddate() {
        return enddate;
    }
    public void setEnddate(Date enddate) {
        this.enddate = enddate;
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
    public Date getInsertDT() {
        return InsertDT;
    }
    public void setInsertDT(Date insertDT) {
        InsertDT = insertDT;
    }
    public String getUpdateUID() {
        return UpdateUID;
    }
    public void setUpdateUID(String updateUID) {
        UpdateUID = updateUID;
    }
    public Date getUpdateDT() {
        return UpdateDT;
    }
    public void setUpdateDT(Date updateDT) {
        UpdateDT = updateDT;
    }    
    public Integer getAttachFileNum() {
        return attachFileNum;
    }
    public void setAttachFileNum(Integer attachFileNum) {
        this.attachFileNum = attachFileNum;
    }
    public Integer getCommentNum() {
        return commentNum;
    }
    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }
    
    
    public ModelTraining() {
        super();
    }
    public ModelTraining(Integer articleno) {
        super();
        this.articleno = articleno;
    }
    
    @Override
    public String toString() {
        return "ModelTraining [articleno=" + articleno
                + ", title=" + title + ", content=" + content + ", userid="
                + userid + ", hit=" + hit + ", regdate=" + regdate + ", enddate=" + enddate +", UseYN="
                + UseYN + ", InsertUID=" + InsertUID + ", InsertDT=" + InsertDT
                + ", UpdateUID=" + UpdateUID + ", UpdateDT=" + UpdateDT + "]";
    }
    
    
    
}

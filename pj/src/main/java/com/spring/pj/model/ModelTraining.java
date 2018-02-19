package com.spring.pj.model;

import java.util.Date;

public class ModelTraining {
    
    Integer articleno ;
    String  title     ; 
    String  content   ;
    String  userid     ;
    Integer hit       ;
    Date    regdate   ;
    Boolean UseYN     ;
    Integer attachFileNum;
  
    
    
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
    
    public Boolean getUseYN() {
        return UseYN;
    }
    public void setUseYN(Boolean useYN) {
        UseYN = useYN;
    }
   
    
    public Integer getAttachFileNum() {
        return attachFileNum;
    }
    public void setAttachFileNum(Integer attachFileNum) {
        this.attachFileNum = attachFileNum;
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
        return "ModelTraining [articleno=" + articleno + ", title=" + title
                + ", content=" + content + ", userid=" + userid + ", hit=" + hit
                + ", regdate=" + regdate + ", UseYN=" + UseYN
                + ", attachFileNum=" + attachFileNum + "]";
    }
    


    
    
}

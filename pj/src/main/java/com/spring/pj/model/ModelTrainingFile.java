package com.spring.pj.model;

import java.util.Date;

public class ModelTrainingFile {
    Integer attachfileno   ;
    String  filenameorig   ;
    String  filenametemp   ;
    String  filetype       ;
    Long    filesize       ;
    Integer articleno      ;
    Boolean UseYN          ; 
  
    
    public Integer getAttachfileno() {
        return attachfileno;
    }
    public void setAttachfileno(Integer attachfileno) {
        this.attachfileno = attachfileno;
    }
    public String getFilenameorig() {
        return filenameorig;
    }
    public void setFilenameorig(String filenameorig) {
        this.filenameorig = filenameorig;
    }
    public String getFilenametemp() {
        return filenametemp;
    }
    public void setFilenametemp(String filenametemp) {
        this.filenametemp = filenametemp;
    }
    public String getFiletype() {
        return filetype;
    }
    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }
    public Long getFilesize() {
        return filesize;
    }
    public void setFilesize(Long filesize) {
        this.filesize = filesize;
    }
    public Integer getArticleno() {
        return articleno;
    }
    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }
    public Boolean getUseYN() {
        return UseYN;
    }
    public void setUseYN(Boolean useYN) {
        UseYN = useYN;
    }
    
    
    @Override
    public String toString() {
        return "ModelTrainingFile [attachfileno=" + attachfileno
                + ", filenameorig=" + filenameorig + ", filenametemp="
                + filenametemp + ", filetype=" + filetype + ", filesize="
                + filesize + ", articleno=" + articleno + ", UseYN=" + UseYN
                + "]";
    }
    public ModelTrainingFile() {
        super();
    }
    public ModelTrainingFile(Integer attachfileno) {
        super();
        this.attachfileno = attachfileno;
    }    
    public ModelTrainingFile(String filenameorig, String filetype, Long filesize, Integer articleno) {
        super();
        this.filenameorig = filenameorig;
        this.filetype = filetype;
        this.filesize = filesize;
        this.articleno = articleno;
    }
}

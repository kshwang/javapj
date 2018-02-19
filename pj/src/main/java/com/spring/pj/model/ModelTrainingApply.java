package com.spring.pj.model;

public class ModelTrainingApply {
    
    private Integer applyno   = null;
    private Integer userno    = null;// `userno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    private Integer articleno = null;

    public ModelTrainingApply() {
        super();
    }

    public Integer getApplyno() {
        return applyno;
    }

    public void setApplyno(Integer applyno) {
        this.applyno = applyno;
    }

    public Integer getUserno() {
        return userno;
    }

    public void setUserno(Integer userno) {
        this.userno = userno;
    }

    public Integer getArticleno() {
        return articleno;
    }

    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }

    @Override
    public String toString() {
        return "ModelTrainingApply [applyno=" + applyno + ", userno=" + userno
                + ", articleno=" + articleno + "]";
    }
    
}

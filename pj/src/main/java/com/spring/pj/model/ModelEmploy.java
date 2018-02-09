package com.spring.pj.model;

public class ModelEmploy {
    private Integer detpno = null;
    private String detpname  ="";        //` VARCHAR(50) NOT NULL,
    private String detptitle ="";        //` VARCHAR(50) NULL DEFAULT NULL,
    private String detpperiod="";        //` VARCHAR(50) NULL DEFAULT NULL,
    private String detpexpiry = "";
    private String detptitleinfo="";
    private Integer useYN = null;
    
     public Integer getDetpno() {
        return detpno;
    }


    public void setDetpno(Integer detpno) {
        this.detpno = detpno;
    }


    public String getDetpname() {
        return detpname;
    }


    public void setDetpname(String detpname) {
        this.detpname = detpname;
    }


    public String getDetptitle() {
        return detptitle;
    }


    public void setDetptitle(String detptitle) {
        this.detptitle = detptitle;
    }


    public String getDetpperiod() {
        return detpperiod;
    }


    public void setDetpperiod(String detpperiod) {
        this.detpperiod = detpperiod;
    }


    public String getDetpexpiry() {
        return detpexpiry;
    }


    public void setDetpexpiry(String detpexpiry) {
        this.detpexpiry = detpexpiry;
    }


    public String getDetptitleinfo() {
        return detptitleinfo;
    }


    public void setDetptitleinfo(String detptitleinfo) {
        this.detptitleinfo = detptitleinfo;
    }


    public Integer getUseYN() {
        return useYN;
    }


    public void setUseYN(Integer useYN) {
        this.useYN = useYN;
    }


    @Override
    public String toString() {
        return "ModelEmploy [detpno=" + detpno + ", detpname=" + detpname
                + ", detptitle=" + detptitle + ", detpperiod=" + detpperiod
                + ", detpexpiry=" + detpexpiry + ", detptitleinfo="
                + detptitleinfo + ", useYN=" + useYN + "]";
    }


    public ModelEmploy() {
        super();
    }
    
    
    
    
    
    
}

package com.spring.pj.model;

public class ModelEmploy {
    private String empname  ="";        //` VARCHAR(50) NOT NULL,
    private String emptitle ="";        //` VARCHAR(50) NULL DEFAULT NULL,
    private String empexpiry="";        //` VARCHAR(50) NULL DEFAULT NULL,
    
    
    
    public String getEmpname() {
        return empname;
    }
    public void setEmpname(String empname) {
        this.empname = empname;
    }
    public String getEmptitle() {
        return emptitle;
    }
    public void setEmptitle(String emptitle) {
        this.emptitle = emptitle;
    }
    public String getEmpexpiry() {
        return empexpiry;
    }
    public void setEmpexpiry(String empexpiry) {
        this.empexpiry = empexpiry;
    }
    @Override
    public String toString() {
        return "ModelEmploy [empname=" + empname + ", emptitle=" + emptitle
                + ", empexpiry=" + empexpiry + "]";
    }
    public ModelEmploy() {
        super();
    }
    
    
}

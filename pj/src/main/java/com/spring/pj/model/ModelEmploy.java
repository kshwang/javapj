package com.spring.pj.model;

public class ModelEmploy {
    private String jobname  ="";        //` VARCHAR(50) NOT NULL,
    private String jobtitle ="";        //` VARCHAR(50) NULL DEFAULT NULL,
    private String empexpiry="";        //` VARCHAR(50) NULL DEFAULT NULL,
    private String period = "";
    
    
    public String getJobname() {
        return jobname;
    }
    public void setJobname(String jobname) {
        this.jobname = jobname;
    }
    public String getJobtitle() {
        return jobtitle;
    }
    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }
    public String getEmpexpiry() {
        return empexpiry;
    }
    public void setEmpexpiry(String empexpiry) {
        this.empexpiry = empexpiry;
    }
   
    public String getPeriod() {
        return period;
    }
    public void setPeriod(String period) {
        this.period = period;
    }
    
    
    @Override
    public String toString() {
        return "ModelEmploy [jobname=" + jobname + ", jobtitle=" + jobtitle
                + ", empexpiry=" + empexpiry + ", period=" + period + "]";
    }
    public ModelEmploy() {
        super();
    }
    
    
    
    
    
    
}

package com.spring.pj.model;

public class ModelUser {
    
    private Integer userno    = null;// `userno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    private String  userid    = ""  ;// `userid` VARCHAR(50) NOT NULL,
    private String  email     = ""  ;// `email` VARCHAR(100) NOT NULL,
    private String  passwd    = ""  ;// `passwd` VARCHAR(30) NULL DEFAULT NULL,
    private String  name      = ""  ;// `name` VARCHAR(30) NULL DEFAULT NULL,
    private String  address   = ""  ;
    private String  mobile    = ""  ;// `mobile` VARCHAR(20) NULL DEFAULT NULL,
    private Integer q_no      = null  ;
    private String  q_answer  = ""  ;
    private Integer userclass = null;
    private Boolean retireYN  = null;
    public ModelUser() {
        super();
    }
    public Integer getUserno() {
        return userno;
    }
    public void setUserno(Integer userno) {
        this.userno = userno;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public Integer getQ_no() {
        return q_no;
    }
    public void setQ_no(Integer q_no) {
        this.q_no = q_no;
    }
    public String getQ_answer() {
        return q_answer;
    }
    public void setQ_answer(String q_answer) {
        this.q_answer = q_answer;
    }
    public Integer getUserclass() {
        return userclass;
    }
    public void setUserclass(Integer userclass) {
        this.userclass = userclass;
    }
    public Boolean getRetireYN() {
        return retireYN;
    }
    public void setRetireYN(Boolean retireYN) {
        this.retireYN = retireYN;
    }
    @Override
    public String toString() {
        return "ModelUser [userno=" + userno + ", userid=" + userid + ", email="
                + email + ", passwd=" + passwd + ", name=" + name + ", address="
                + address + ", mobile=" + mobile + ", userclass=" + userclass
                + ", retireYN=" + retireYN + "]";
    }
    
    
}

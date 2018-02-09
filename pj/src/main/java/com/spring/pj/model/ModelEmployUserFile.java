package com.spring.pj.model;

public class ModelEmployUserFile {
    private Integer uploadFileNo ;     //` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    private Integer detpno       ;     //` INT(11) NOT NULL,
    private String name         ;     //` VARCHAR(50) NOT NULL,
    private String phone        ;     //` VARCHAR(50) NOT NULL,
    private String mail         ;     //` VARCHAR(50) NOT NULL,
    private String address      ;     //` VARCHAR(50) NOT NULL,
    private String url          ;     //` VARCHAR(50) NULL DEFAULT NULL,
    private String fileNameOrig ;     //` VARCHAR(100) NOT NULL,
    private String fileNameTemp ;     //` VARCHAR(100) NOT NULL,
    private Long fileSize     ;     //` INT(10) UNSIGNED NOT NULL,
    private String contentType  ;     //` VARCHAR(30) NOT NULL,
    private Boolean useYN        ;     //` TINYINT(1) NULL DEFAULT '1',

    private ModelEmploy emp = null;
    
    public Integer getUploadFileNo() {
        return uploadFileNo;
    }
    public void setUploadFileNo(Integer uploadFileNo) {
        this.uploadFileNo = uploadFileNo;
    }
    public Integer getDetpno() {
        return detpno;
    }
    public void setDetpno(Integer detpno) {
        this.detpno = detpno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getFileNameOrig() {
        return fileNameOrig;
    }
    public void setFileNameOrig(String fileNameOrig) {
        this.fileNameOrig = fileNameOrig;
    }
    public String getFileNameTemp() {
        return fileNameTemp;
    }
    public void setFileNameTemp(String fileNameTemp) {
        this.fileNameTemp = fileNameTemp;
    }
    public Long getFileSize() {
        return fileSize;
    }
    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }
    public String getContentType() {
        return contentType;
    }
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
    public Boolean getUseYN() {
        return useYN;
    }
    public void setUseYN(Boolean useYN) {
        this.useYN = useYN;
    }
    
  
    public ModelEmploy getEmp() {
        return emp;
    }
    public void setEmp(ModelEmploy emp) {
        this.emp = emp;
    }
    @Override
    public String toString() {
        return "ModelEmployUserFile [uploadFileNo=" + uploadFileNo + ", detpno="
                + detpno + ", name=" + name + ", phone=" + phone + ", mail="
                + mail + ", address=" + address + ", url=" + url
                + ", fileNameOrig=" + fileNameOrig + ", fileNameTemp="
                + fileNameTemp + ", fileSize=" + fileSize + ", contentType="
                + contentType + ", useYN=" + useYN + "]";
    }
    public ModelEmployUserFile() {
        super();
    }
    
    
    
}

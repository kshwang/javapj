package com.spring.pj.model;

public class ModelQuestionForPW {
    private Integer q_no        = null;
    private String  q_statement = ""  ;
    
    public ModelQuestionForPW() {
        super();
    }

    public Integer getQ_no() {
        return q_no;
    }

    public void setQ_no(Integer q_no) {
        this.q_no = q_no;
    }

    public String getQ_statement() {
        return q_statement;
    }

    public void setQ_statement(String q_statement) {
        this.q_statement = q_statement;
    }
    
    
}

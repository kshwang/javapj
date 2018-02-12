package com.spring.pj.inf;

import com.spring.pj.model.ModelTraining;


public interface IServiceTraining extends IDaoTraining {
    
    ModelTraining transArticle(int articleno);
    int transDeleteArticle(int articleno);
  
}

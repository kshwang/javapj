package com.spring.pj.inf;

import java.util.List;

import com.spring.pj.model.ModelComments;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingApply;
import com.spring.pj.model.ModelTrainingFile;

public interface IDaoTraining {
    
    
    List<ModelTraining> selectAll();
    
    public int getArticleTotalRecord(String searchWord);

    public List<ModelTraining> getArticleList( String searchWord, int start, int end);

    public ModelTraining getArticle(int articleno);

    public int insertArticle(ModelTraining article);

    public int updateArticle(ModelTraining setValue, ModelTraining whereValue);

    public int deleteArticle(ModelTraining article);

    public int increaseHit(int articleno);
    
    public ModelTraining getNextArticle(int articleno,String searchWord);

    public ModelTraining getPrevArticle(int articleno, String searchWord);

    public ModelTrainingFile getAttachFile(int attachFileNo);
    
    public List<ModelTrainingFile> getAttachFileList(int articleno);

    public int insertAttachFile(ModelTrainingFile attachFile);

    public int deleteAttachFile(ModelTrainingFile attachFile);
    
    public int insertTrainingApply(ModelTrainingApply apply);

    public int deleteTrainingApply(ModelTrainingApply apply);
    
    public ModelTrainingApply selectTraingApplyOne(int articleno, int userno);

}
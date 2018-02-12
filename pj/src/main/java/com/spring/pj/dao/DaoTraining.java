package com.spring.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj.inf.IDaoTraining;
import com.spring.pj.model.ModelComments;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingApply;
import com.spring.pj.model.ModelTrainingFile;



@Repository
public class DaoTraining implements IDaoTraining {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired    
    SqlSession session;    

    @Override
    public List<ModelTraining> selectAll() {
        return session.selectList("mapper.mapperTraining.selectAll");
    }
    
    

    @Override
    public int getArticleTotalRecord(String searchWord) {
        Map<String, String> map = new HashMap<String, String>();
        
        map.put("searchWord", searchWord );
        
        return  session.selectOne("mapper.mapperTraining.getArticleTotalRecord", map);        
    }

    @Override
    public List<ModelTraining> getArticleList( String searchWord, int start, int end) {
        
        Map<String, Object> map = new HashMap<String, Object>();
      
        map.put("searchWord", searchWord );
        map.put("start"     , start      );
        map.put("end"       , end        );
        
        return  session.selectList("mapper.mapperTraining.getArticleList", map);        
    }

    @Override
    public ModelTraining getArticle(int articleno) {
        return  session.selectOne("mapper.mapperTraining.getArticle", articleno);        
    }

    @Override
    public int insertArticle(ModelTraining article) {
        session.insert("mapper.mapperTraining.insertArticle", article );
        
        return article.getArticleno(); // inserted primary key 값이 반환된다.
    }

    @Override
    public int updateArticle(ModelTraining setValue, ModelTraining whereValue) {
        
        Map<String, ModelTraining> map = new HashMap<String, ModelTraining>();
        map.put("setValue", setValue);
        map.put("whereValue", whereValue);
        
        return  session.update("mapper.mapperTraining.updateArticle", map );    
    }

    @Override
    public int deleteArticle(ModelTraining article) {
        return  session.delete("mapper.mapperTraining.deleteArticle", article ); 
    }

    @Override
    public int increaseHit(int articleno) {
        return  session.update("mapper.mapperTraining.increaseHit", articleno ); 
    }

    @Override
    public ModelTraining getNextArticle(int articleno, String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("articleno" , articleno  );
        map.put("searchWord", searchWord );
        
        return  session.selectOne("mapper.mapperTraining.getNextArticle", map);        
    }

    @Override
    public ModelTraining getPrevArticle(int articleno, String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("articleno" , articleno  );
        map.put("searchWord", searchWord );
        return  session.selectOne("mapper.mapperTraining.getPrevArticle", map);        
    }

    @Override
    public ModelTrainingFile getAttachFile(int attachFileNo) {
        return  session.selectOne("mapper.mapperTraining.getAttachFile", attachFileNo);        
    }

    @Override
    public List<ModelTrainingFile> getAttachFileList(int articleno) {
        return  session.selectList("mapper.mapperTraining.getAttachFileList", articleno);        
    }

    @Override
    public int insertAttachFile(ModelTrainingFile attachFile) {
        return  session.insert("mapper.mapperTraining.insertAttachFile", attachFile );        
    }

    @Override
    public int deleteAttachFile(ModelTrainingFile attachFile) {
        return  session.delete("mapper.mapperTraining.deleteAttachFile", attachFile );        
    }


    @Override
    public int insertTrainingApply(ModelTrainingApply apply) {
        return  session.insert("mapper.mapperTraining.insertTrainingApply", apply );        
    }
    
    @Override
    public int deleteTrainingApply(ModelTrainingApply apply) {
        return  session.delete("mapper.mapperTraining.deleteTrainingApply", apply );        
    }



    @Override
    public ModelTrainingApply selectTraingApplyOne(int articleno, int userno) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("articleno", articleno);
        map.put("userno", userno);
        return session.selectOne("mapper.mapperTraining.selectTraingApplyOne", map);
    }

    
}

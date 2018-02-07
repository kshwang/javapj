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
import com.spring.pj.model.ModelTrainingBoard;
import com.spring.pj.model.ModelTrainingFile;



@Repository
public class DaoTraining implements IDaoTraining {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired    
    SqlSession session;    

    @Override
    public String getBoardName(String boardcd) {
        return  session.selectOne("mapper.mapperTraining.getBoardName", boardcd);        
    }

    @Override
    public ModelTrainingBoard getBoardOne(String boardcd) {
        return  session.selectOne("mapper.mapperTraining.getBoardOne", boardcd);        
    }

    @Override
    public int getBoardTotalRecord(String boardnm) {
        return  session.selectOne("mapper.mapperTraining.getBoardTotalRecord", boardnm); 
    }

    @Override
    public List<ModelTrainingBoard> getBoardList(String searchWord) {
        return  session.selectList("mapper.mapperTraining.getBoardList", searchWord);        
    }

    @Override
    public int insertBoard(ModelTrainingBoard board) {
        return  session.insert("mapper.mapperTraining.insertBoard", board);        
    }

    @Override
    public int updateBoard(ModelTrainingBoard setValue, ModelTrainingBoard whereValue) {
        Map<String, ModelTrainingBoard> map = new HashMap<String, ModelTrainingBoard>();
        map.put("setValue", setValue);
        map.put("whereValue", whereValue);
        return  session.update("mapper.mapperTraining.updateBoard", map);        
    }

    @Override
    public int deleteBoard(ModelTrainingBoard board) {
        return  session.delete("mapper.mapperTraining.deleteBoard", board);        
    }

    @Override
    public List<ModelTrainingBoard> getBoardPaging(String searchWord, int start, int end) {
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchWord", searchWord );
        map.put("start"     , start      );
        map.put("end"       , end        );
        
        List<ModelTrainingBoard> result = session.selectList("mapper.mapperTraining.getBoardPaging", map);
        return   result;
    }

    @Override
    public int insertBoardList(List<ModelTrainingBoard> list) {
        return  session.insert("mapper.mapperTraining.insertBoardList", list);        
    }

    @Override
    public int getArticleTotalRecord(String boardcd, String searchWord) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("boardcd"   , boardcd    );
        map.put("searchWord", searchWord );
        
        return  session.selectOne("mapper.mapperTraining.getArticleTotalRecord", map);        
    }

    @Override
    public List<ModelTraining> getArticleList(String boardcd, String searchWord, int start, int end) {
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardcd"   , boardcd    );
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
    public ModelTraining getNextArticle(int articleno, String boardcd, String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardcd"   , boardcd    );
        map.put("articleno" , articleno  );
        map.put("searchWord", searchWord );
        
        return  session.selectOne("mapper.mapperTraining.getNextArticle", map);        
    }

    @Override
    public ModelTraining getPrevArticle(int articleno, String boardcd, String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardcd"   , boardcd    );
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
    public int insertComment(ModelComments comment) {
        
        // inserted 된 primary key 값, commentno 를 반환.
        session.insert("mapper.mapperTraining.insertComment", comment );
        return comment.getCommentno();
    }

    @Override
    public int updateComment(ModelComments setValue, ModelComments whereValue) {
        
        Map<String, ModelComments> map = new HashMap<>();
        map.put("setValue", setValue);
        map.put("whereValue", whereValue);
        
        return  session.update("mapper.mapperTraining.updateComment", map );        
    }

    @Override
    public int deleteComment(ModelComments comment) {
        return  session.delete("mapper.mapperTraining.deleteComment", comment );        
    }

    @Override
    public ModelComments getComment(int commentNo) {
        return  session.selectOne("mapper.mapperTraining.getComment", commentNo);        
    }

    @Override
    public List<ModelComments> getCommentList(int articleno) {
        return  session.selectList("mapper.mapperTraining.getCommentList", articleno);        
    }

    /* @Override
    public ModelTrainingBoard getBoardOne(String boardcd) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int insertBoard(ModelTrainingBoard board) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateBoard(ModelTrainingBoard setValue,
            ModelTrainingBoard whereValue) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int deleteBoard(ModelTrainingBoard board) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertBoardList(List<ModelTrainingBoard> list) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ModelTraining getArticle(int articleno) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int insertArticle(ModelTraining article) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateArticle(ModelTraining setValue, ModelTraining whereValue) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int deleteArticle(ModelTraining article) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ModelTraining getNextArticle(int articleno, String boardcd,
            String searchWord) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelTraining getPrevArticle(int articleno, String boardcd,
            String searchWord) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelTrainingFile getAttachFile(int attachFileNo) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int insertAttachFile(ModelTrainingFile attachFile) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int deleteAttachFile(ModelTrainingFile attachFile) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ModelTrainingBoard getBoardOne(String boardcd) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int insertBoardList(List<ModelTrainingBoard> list) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ModelTraining getArticle(int articleno) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelTraining getNextArticle(int articleno, String boardcd,
            String searchWord) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelTraining getPrevArticle(int articleno, String boardcd,
            String searchWord) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelTrainingFile getAttachFile(int attachFileNo) {
        // TODO Auto-generated method stub
        return null;
    }*/
    
}

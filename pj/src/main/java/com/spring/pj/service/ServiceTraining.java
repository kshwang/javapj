package com.spring.pj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pj.inf.IDaoTraining;
import com.spring.pj.inf.IServiceTraining;
import com.spring.pj.model.ModelComments;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingApply;
import com.spring.pj.model.ModelTrainingFile;

@Service
public class ServiceTraining implements IServiceTraining {
    // SLF4J Logging
    private static Logger logger = LoggerFactory
            .getLogger(ServiceTraining.class);
    
    @Autowired
    IDaoTraining daotrn;

    @Override
    public List<ModelTraining> selectAll() {
        List<ModelTraining> rs = null;
        
        try {
            rs = daotrn.selectAll();
        } catch (Exception e) {
            logger.error("selectAll" + e.getMessage());
            throw e;
            
        }
        
        return rs;
    }
    @Override
    public int getArticleTotalRecord(String searchWord) {
        int result = -1;
        try {
            result = daotrn.getArticleTotalRecord(searchWord);
        } catch (Exception e) {
            logger.error("getArticleTotalRecord  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public List<ModelTraining> getArticleList( String searchWord,
            int start, int end) {
        
        List<ModelTraining> result = null;
        try {
            result = daotrn.getArticleList( searchWord, start, end);
        } catch (Exception e) {
            logger.error("getArticleList  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public ModelTraining getArticle(int articleno) {
        
        ModelTraining result = null;
        try {
            // 상세보기를 할때마다 페이지 조회수를 1 증가 시키도록 하려면
            // 이를 위해서는 transArticle() 메서드를 사용하시오.
            result = daotrn.getArticle(articleno);
        } catch (Exception e) {
            logger.error("getArticle  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int insertArticle(ModelTraining article) {
        int result = -1;
        try {
            result = daotrn.insertArticle(article);
        } catch (Exception e) {
            logger.error("insertArticle " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int updateArticle(ModelTraining setValue, ModelTraining whereValue) {
        
        int result = -1;
        try {
            result = daotrn.updateArticle(setValue, whereValue);
        } catch (Exception e) {
            logger.error("updateArticle " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int deleteArticle(ModelTraining article) {
        int result = -1;
        try {
            result = daotrn.deleteArticle(article);
        } catch (Exception e) {
            logger.error("deleteArticle  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int increaseHit(int articleno) {
        int result = -1;
        try {
            result = daotrn.increaseHit(articleno);
        } catch (Exception e) {
            logger.error("increaseHit  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public ModelTraining getNextArticle(int articleno, 
            String searchWord) {
        
        ModelTraining result = null;
        try {
            result = daotrn.getNextArticle(articleno, searchWord);
        } catch (Exception e) {
            logger.error("getNextArticle  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public ModelTraining getPrevArticle(int articleno,
            String searchWord) {
        ModelTraining result = null;
        try {
            result = daotrn.getPrevArticle(articleno, searchWord);
        } catch (Exception e) {
            logger.error("getPrevArticle  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public ModelTrainingFile getAttachFile(int attachFileNo) {
        ModelTrainingFile result = null;
        try {
            result = daotrn.getAttachFile(attachFileNo);
        } catch (Exception e) {
            logger.error("getAttachFile  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public List<ModelTrainingFile> getAttachFileList(int articleno) {
        List<ModelTrainingFile> result = null;
        try {
            result = daotrn.getAttachFileList(articleno);
        } catch (Exception e) {
            logger.error("getAttachFileList  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int insertAttachFile(ModelTrainingFile attachFile) {
        int result = -1;
        try {
            result = daotrn.insertAttachFile(attachFile);
        } catch (Exception e) {
            logger.error("insertAttachFile " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int deleteAttachFile(ModelTrainingFile attachFile) {
        int result = -1;
        try {
            result = daotrn.deleteAttachFile(attachFile);
        } catch (Exception e) {
            logger.error("deleteAttachFile " + e.getMessage());
        }
        
        return result;
    }
    
   
    
    @Override
    public ModelTraining transArticle(int articleno) {
        
        ModelTraining result = null;
        try {
            // 상세보기를 할때마다 페이지 조회수를 1 증가 시키기 위해서.
            // 하단에 목록에서 조회수를 제대로 보기위해서는
            // 목록 레코드를 페치하기 전에 조회수를 먼저 증가시켜야 한다.
            // 사용자 IP 와 시간을 고려해서 조회수를 증가하도록...
            daotrn.increaseHit(articleno);
            result = daotrn.getArticle(articleno);
        } catch (Exception e) {
            logger.error("transArticle  " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int transDeleteArticle(int articleno) {
        
        int result = -1;
        
        // transcation을 이용하여 삭제를 묶는다.
        // tb_bbs_attachfile, tb_bbs_comment, tb_bbs_article
        try {
            ModelTrainingFile attachFile = new ModelTrainingFile();
            attachFile.setArticleno(articleno);
            daotrn.deleteAttachFile(attachFile);
            
            /* daoboard.deleteComment(new ModelComments(articleno)); */
            daotrn.deleteArticle(new ModelTraining(articleno));
            result = 1;
        } catch (Exception e) {
            logger.error("transDeleteArticle" + e.getMessage());
        }
        
        return result;
    }
    @Override
    public int insertTrainingApply(ModelTrainingApply apply) {
        int result = -1;
        try {
            result = daotrn.insertTrainingApply(apply);
        } catch (Exception e) {
            logger.error("insertTrainingApply " + e.getMessage());
        }
        
        return result;
    }
    
    @Override
    public int deleteTrainingApply(ModelTrainingApply apply) {
        int result = -1;
        try {
            result = daotrn.deleteTrainingApply(apply);
        } catch (Exception e) {
            logger.error("deleteArticle  " + e.getMessage());
        }
        
        return result;
    }




    @Override
    public ModelTrainingApply selectTraingApplyOne(int articleno, int userno) {
        ModelTrainingApply result = null;
        try {
            result = daotrn.selectTraingApplyOne(articleno, userno);
        } catch (Exception e) {
            logger.error("selectTraingApplyOne  " + e.getMessage());
        }
        
        return result;
    }
}

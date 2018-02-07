package com.spring.pj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pj.inf.IDaoQnaBoard;
import com.spring.pj.inf.IServiceQnaBoard;
import com.spring.pj.model.ModelQnaBoard;


@Service
public class ServiceQnaBoard implements IServiceQnaBoard {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    IDaoQnaBoard dao;
    
    @Override
    public List<ModelQnaBoard> selectAll() {
        List<ModelQnaBoard> rs = null;
        
        try {
            rs = dao.selectAll();
        } catch (Exception e) {
            logger.error("selectAll" + e.getMessage());
            throw e;
            
        }
        
        return rs;
    }

    @Override
    public int getQnaBoardTotalRecord(String searchWord) {
        int rs = -1;
        try {
            rs = dao.getQnaBoardTotalRecord(searchWord);
        } catch (Exception e) {
            logger.error("getQnaBoardTotalRecord" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public void increaseQnaHit(int bno) {
        try {
            dao.increaseQnaHit(bno);
        } catch (Exception e) {
            logger.error("increaseQnaHit" + e.getMessage());
            throw e;
            
        }
        
    }

    @Override
    public int insertQna(ModelQnaBoard qna) {
        int rs = -1;
        try {
            dao.insertQna(qna);
        } catch (Exception e) {
            logger.error("insertQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public int updateQna(ModelQnaBoard searchValue, ModelQnaBoard updateValue) {
        int rs = -1;
        try {
            rs = dao.updateQna(searchValue, updateValue);
        } catch (Exception e) {
            logger.error("updateQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public List<ModelQnaBoard> getQnaList(String searchWord, int start,
            int end) {
        List<ModelQnaBoard> rs = null;
        try {
            rs = dao.getQnaList(searchWord, start, end);
        } catch (Exception e) {
            logger.error("getQnaList" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public ModelQnaBoard getQna(int bno) {
        ModelQnaBoard rs = null;
        
        try {
            rs = dao.getQna(bno);
        } catch (Exception e) {
            logger.error("getQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public ModelQnaBoard getNextQna(int bno, String searchWord) {
        ModelQnaBoard rs = null;
        
        try {
            rs = dao.getNextQna(bno, searchWord);
        } catch (Exception e) {
            logger.error("getNextQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public ModelQnaBoard getPrevQna(int bno, String searchWord) {
        ModelQnaBoard rs = null;
        
        try {
            rs = dao.getPrevQna(bno, searchWord);
        } catch (Exception e) {
            logger.error("getPrevQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public int deleteQna(int bno) {
        int rs = -1;
        try {
            rs = dao.deleteQna(bno);
        } catch (Exception e) {
            logger.error("deleteQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
}

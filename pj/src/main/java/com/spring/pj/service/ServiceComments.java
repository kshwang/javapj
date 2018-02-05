package com.spring.pj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pj.inf.IDaoComments;
import com.spring.pj.inf.IServiceComments;
import com.spring.pj.model.ModelComments;

@Service
public class ServiceComments implements IServiceComments {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    IDaoComments dao;
    
    @Override
    public List<ModelComments> getComment(int bno) {
        List<ModelComments> rs = null;
        
        try {
            rs = dao.getComment(bno);
        } catch (Exception e) {
            logger.error("getComment" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
    
    @Override
    public int insertComment(ModelComments comment) {
        int rs = -1;
        try {
            rs = dao.insertComment(comment);
        } catch (Exception e) {
            logger.error("insertComment" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
    
    @Override
    public int updateComment(String memo, int commentno) {
        int rs = -1;
        try {
            rs = dao.updateComment(memo, commentno);
        } catch (Exception e) {
            logger.error("updateComment" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
    
    @Override
    public int deleteComment(int commentno) {
        int rs = -1;
        try {
            rs = dao.deleteComment(commentno);
        } catch (Exception e) {
            logger.error("deleteComment" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public ModelComments getCommentOne(int commentno) {
        ModelComments rs = null;
        try {
            rs = dao.getCommentOne(commentno);
        } catch (Exception e) {
            logger.error("getCommentOne" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
}

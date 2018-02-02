package com.spring.pj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pj.inf.IDaoEmploy;
import com.spring.pj.inf.IServiceEmploy;
import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelQnaBoard;
@Service
public class ServiceEmploy implements IServiceEmploy {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    
    @Autowired
    IDaoEmploy dao;
   
    
    @Override
    public List<ModelEmploy> selectAll() {
        List<ModelEmploy> rs = null;
        
        try {
            rs = dao.selectAll();
        } catch (Exception e) {
            logger.error("selectAll" + e.getMessage());
            throw e;
            
        }
        
        return rs;
    }

    @Override
    public int getEmployTotalRecord(String searchWord) {
        int rs = -1;
        try {
            rs = dao.getEmployTotalRecord(searchWord);
        } catch (Exception e) {
            logger.error("getEmployTotalRecord" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public List<ModelEmploy> getEmployList(String searchWord, int start,
            int end) {
        List<ModelEmploy> rs = null;
        try {
            rs = dao.getEmployList(searchWord, start, end);
        } catch (Exception e) {
            logger.error("getEmployList" + e.getMessage());
            throw e;
            
        }
        return rs;
    }
    
}

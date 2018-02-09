package com.spring.pj.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pj.inf.IDaoEmploy;
import com.spring.pj.inf.IServiceEmploy;
import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelEmployUserFile;
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

    @Override
    public int insertEmploy(ModelEmploy emp) {
        int rs = -1;
        try {
            dao.insertEmploy(emp);
        } catch (Exception e) {
            logger.error("insertQna" + e.getMessage());
            throw e;
            
        }
        return rs;
    }

    @Override
    public List<ModelEmploy> selectDetpName() {
        List<ModelEmploy> rs = null;
        
        try {
            rs = dao.selectDetpName();
        } catch (Exception e) {
            logger.error("selectDetpName" + e.getMessage());
            throw e;
         }
        return rs;
    }

    @Override
    public ModelEmploy selectDetpno(int deptno) {
        ModelEmploy rs = null;
        try {
             rs = dao.selectDetpno(deptno);
        } catch (Exception e) {
            logger.error("selectDetpno" + e.getMessage());
            throw e;
        }
        return rs;
    }

    @Override
    public int updateEmploy(ModelEmploy employ) {
        int rs=-1;
        try {
            rs = dao.updateEmploy(employ);
        } catch (Exception e) {
            logger.error("updateEmploy" + e.getMessage());
            throw e;
        }
        return rs;
    }

    @Override
    public int deleteEmploy(ModelEmploy employ) {
       int rs=-1;
    try {
        rs = dao.deleteEmploy(employ);
    } catch (Exception e) {
        logger.error("deleteEmploy" + e.getMessage());
        throw e;
    }
        return rs;
    }

    @Override
    public List<ModelEmployUserFile> selectuploaduser() {
        List<ModelEmployUserFile> rs=null;
        try {
            rs = dao.selectuploaduser();
        } catch (Exception e) {
            logger.error("selectuploaduser" + e.getMessage());
            throw e;
        }
            return rs;
    }

    @Override
    public int deleteuploaduser(ModelEmployUserFile deletefile) {
        int rs=-1;
        try {
            rs = dao.deleteuploaduser(deletefile);
        } catch (Exception e) {
            logger.error("deleteuploaduser" + e.getMessage());
            throw e;
        }
            return rs;
    }

    @Override
    public int insertuploaduser(ModelEmployUserFile insertuser) {
        int rs=-1;
        try {
            rs = dao.insertuploaduser(insertuser);
        } catch (Exception e) {
            logger.error("insertuploaduser" + e.getMessage());
            throw e;
        }
        return rs;
    }


   
    
}

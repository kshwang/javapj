package com.spring.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj.inf.IDaoEmploy;
import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelEmployUserFile;
import com.spring.pj.model.ModelQnaBoard;
@Repository
public class DaoEmploy implements IDaoEmploy {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    SqlSession session;
    
    @Override
    public List<ModelEmploy> selectAll() {
        return session.selectList("mapper.mapperEmploy.selectAll");
    }

    @Override
    public int getEmployTotalRecord(String searchWord) {
        return session.selectOne("mapper.mapperEmploy.getEmployTotalRecord", searchWord);
    }

    @Override
    public List<ModelEmploy> getEmployList(String searchWord, int start,
            int end) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchWord", searchWord);
        map.put("start", start);
        map.put("end", end);
        return session.selectList("mapper.mapperEmploy.getEmployList", map);
    }

    
    @Override
    public int insertEmploy(ModelEmploy emp) {
        return session.insert("mapper.mapperEmploy.insertEmploy", emp);
    }

    @Override
    public List<ModelEmploy> selectDetpName() {
        return session.selectList("mapper.mapperEmploy.selectDetpName");
    }

    @Override
    public ModelEmploy selectDetpno(int deptno) {
        return session.selectOne("mapper.mapperEmploy.selectDetpno", deptno);
    }

    @Override
    public int updateEmploy(ModelEmploy employ) {
        return session.update("mapper.mapperEmploy.updateEmploy", employ);
    }

    @Override
    public int deleteEmploy(ModelEmploy employ) {
        return session.delete("mapper.mapperEmploy.deleteEmploy", employ);
    }

    @Override
    public List<ModelEmployUserFile> selectuploaduser() {
        return session.selectList("mapper.mapperEmploy.selectuploaduser");
    }

    @Override
    public int deleteuploaduser(ModelEmployUserFile deletefile) {
        return session.delete("mapper.mapperEmploy.deleteuploaduser", deletefile);
    }

    @Override
    public int insertuploaduser(ModelEmployUserFile insertuser) {
        return session.update("mapper.mapperEmploy.insertuploaduser", insertuser);
    }

  

    
   
    
}

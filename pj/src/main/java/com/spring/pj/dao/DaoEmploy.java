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

    
    
   
    
}

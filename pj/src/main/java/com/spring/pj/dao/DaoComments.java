package com.spring.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj.inf.IDaoComments;
import com.spring.pj.model.ModelComments;


@Repository
public class DaoComments implements IDaoComments {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    SqlSession session;
    
    @Override
    public List<ModelComments> getComment(int bno) {
        return session.selectList("mapper.mapperBoard.getComment", bno);
    }
    
    @Override
    public int insertComment(ModelComments comment) {
        int rs = session.insert("mapper.mapperBoard.insertComment", comment);
        return  comment.getCommentno();
    }
    
    @Override
    public int updateComment(String memo, int commentno) {
        Map<String, Object> map = new HashMap<>();
        
        map.put("memo", memo);
        map.put("commentno", commentno);
        
        return session.update("mapper.mapperBoard.updateComment", map);
    }
    
    @Override
    public int deleteComment(int commentno) {
        return session.update("mapper.mapperBoard.deleteComment", commentno);
    }

    @Override
    public ModelComments getCommentOne(int commentno) {
        return session.selectOne("mapper.mapperBoard.getCommentOne", commentno);
    }
}

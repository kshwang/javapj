package com.spring.pj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj.inf.IDaoQnaBoard;
import com.spring.pj.model.ModelQnaBoard;


@Repository
public class DaoQnaBoard implements IDaoQnaBoard {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    SqlSession session;
    
    @Override
    public List<ModelQnaBoard> selectAll() {
        return session.selectList("mapper.mapperBoard.selectAll");
    }

    @Override
    public int getQnaBoardTotalRecord(String searchWord) {
        return session.selectOne("mapper.mapperBoard.getQnaBoardTotalRecord", searchWord);
    }

    @Override
    public void increaseQnaHit(int bno) {
        session.update("mapper.mapperBoard.increaseQnaHit", bno);
        
    }

    @Override
    public int insertQna(ModelQnaBoard qna) {
        return session.insert("mapper.mapperBoard.insertQna", qna);
    }

    @Override
    public int updateQna(ModelQnaBoard searchValue, ModelQnaBoard updateValue) {
        Map<String, ModelQnaBoard> map = new HashMap<>();
        
        map.put("updateValue", updateValue);
        map.put("searchValue", searchValue);
        return session.update("mapper.mapperBoard.updateQna", map);
    }

    @Override
    public List<ModelQnaBoard> getQnaList(String searchWord, int start,
            int end) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchWord", searchWord);
        map.put("start", start);
        map.put("end", end);
        return session.selectList("mapper.mapperBoard.getQnaList", map);
    }

    @Override
    public ModelQnaBoard getQna(int bno) {
        return session.selectOne("mapper.mapperBoard.getQna", bno);
    }

    @Override
    public ModelQnaBoard getNextQna(int bno, String searchWord) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchWord", searchWord);
        map.put("bno", bno);
        return session.selectOne("mapper.mapperBoard.getNextQna", map);
    }

    @Override
    public ModelQnaBoard getPrevQna(int bno, String searchWord) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchWord", searchWord);
        map.put("bno", bno);
        return session.selectOne("mapper.mapperBoard.getPrevQna", map);
    }

    @Override
    public int deleteQna(int bno) {
        return session.update("mapper.mapperBoard.deleteQna", bno);
    }
}

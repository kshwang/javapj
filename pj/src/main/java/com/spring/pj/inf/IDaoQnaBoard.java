package com.spring.pj.inf;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.pj.model.ModelQnaBoard;

public interface IDaoQnaBoard {
    List<ModelQnaBoard> selectAll();
    int getQnaBoardTotalRecord(String searchWord);
    void increaseQnaHit(int bno);
    int insertQna(ModelQnaBoard qna);
    int deleteQna(int bno);
    int updateQna(ModelQnaBoard searchValue, ModelQnaBoard updateValue);
    List<ModelQnaBoard> getQnaList(String searchWord, int start, int end);
    ModelQnaBoard getQna(int bno);
    ModelQnaBoard getNextQna(int bno, String searchWord);
    ModelQnaBoard getPrevQna(int bno, String searchWord);
    
}

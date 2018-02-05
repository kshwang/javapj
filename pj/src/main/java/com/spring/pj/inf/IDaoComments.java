package com.spring.pj.inf;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.pj.model.ModelComments;

public interface IDaoComments {
    List<ModelComments> getComment(int bno);

    ModelComments getCommentOne(int commentno);
    int insertComment(ModelComments comment);
    int updateComment(String memo, int commentno);
    int deleteComment(int commentno);
}

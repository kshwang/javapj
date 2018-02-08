package com.spring.pj.inf;

import java.util.List;

import com.spring.pj.model.ModelEmploy;

public interface IDaoEmploy {
    List<ModelEmploy> selectAll();
    int getEmployTotalRecord(String searchWord);
    List<ModelEmploy> getEmployList(String searchWord, int start, int end);
    int insertEmploy(ModelEmploy empbbs);
    List<ModelEmploy> selectDetpName();
    ModelEmploy selectDetpno(int deptno);
    int updateEmploy (ModelEmploy employ);
    int deleteEmploy(ModelEmploy employ);
}

package com.spring.pj.inf;

import java.util.List;
import java.util.Map;

import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelEmployUserFile;

public interface IDaoEmploy {
    List<ModelEmploy> selectAll();
    int getEmployTotalRecord(String searchWord);
    List<ModelEmploy> getEmployList(String searchWord, int start, int end);
    int insertEmploy(ModelEmploy empbbs);
    List<ModelEmploy> selectDetpName();
    ModelEmploy selectDetpno(int deptno);
    int updateEmploy (ModelEmploy employ);
    int deleteEmploy(ModelEmploy employ);
    List<ModelEmployUserFile> selectuploaduser();
    int deleteuploaduser(ModelEmployUserFile deletefile);
    int insertuploaduser(ModelEmployUserFile insertuser);
}

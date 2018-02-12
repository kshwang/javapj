package com.spring.pj.inf;

import java.util.List;

import com.spring.pj.model.ModelComments;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingApply;
import com.spring.pj.model.ModelTrainingFile;

public interface IDaoTraining {
    
    
    List<ModelTraining> selectAll();
    
    
   

    /*
     * Article테이블. 특정 게시판의 총 게시물 갯수 구하기
     * 
     * 필수인자: boardcd
     * 선택인자: searchWord. if문 처리. 
     */
    public int getArticleTotalRecord(String searchWord);

    /*
     * Article테이블. 게시판 목록
     * article 테이블에서 start부터 end 까지의 row를 반환한다.
     *
     * 필수인자: boardcd, start, end
     * 선택인자: searchWord. if문 처리. 
     */
    public List<ModelTraining> getArticleList( String searchWord, int start, int end);

    /*
     * Article테이블. 게시글 상세보기
     * articleno(기본키)를 이용하여 article 테이블에서 한 개의 row 를 리턴
     */
    public ModelTraining getArticle(int articleno);

    /*
     * Article테이블. 새로운 게시글  추가
     */
    public int insertArticle(ModelTraining article);

    /*
     * Article테이블. 게시글 수정
     * setValue   : set   절에서 사용될 데이터
     * whereValue : where 절에서 사용될 데이터
     */
    public int updateArticle(ModelTraining setValue, ModelTraining whereValue);

    /*
     * Article테이블. 게시글 삭제
     */
    public int deleteArticle(ModelTraining article);

    /*
     * Article테이블. 조회수 증가
     * articleno 조건으로 찾아서 hit 컬럼의 값을 +1 증가 시킨다.
     */
    public int increaseHit(int articleno);
    
    /*
     * Article테이블. 다음글 보기 
     * articleno,boardcd,searchWord->Map 에 담는다
     */
    public ModelTraining getNextArticle(int articleno,String searchWord);

    /*
     * Article테이블. 이전글 보기 
     * articleno,boardcd,searchWord->Map 에 담는다
     */
    public ModelTraining getPrevArticle(int articleno, String searchWord);

    /*
     * AttachFile테이블. 게시글의 첨부파일 정보 가져오기.
     */
    public ModelTrainingFile getAttachFile(int attachFileNo);
    
    /*
     * AttachFile테이블. 게시글의 첨부파일 리스트
     */
    public List<ModelTrainingFile> getAttachFileList(int articleno);

    /*
     * AttachFile테이블. 게시글에 새로운 첨부파일 추가 
     */
    public int insertAttachFile(ModelTrainingFile attachFile);

    /*
     * AttachFile테이블. 게시글에서 첨부파일 삭제
     */
    public int deleteAttachFile(ModelTrainingFile attachFile);
    
    //사용자 정보 등록
    public int insertTrainingApply(ModelTrainingApply apply);

    public int deleteTrainingApply(ModelTrainingApply apply);
    
    public ModelTrainingApply selectTraingApplyOne(int articleno, int userno);

}
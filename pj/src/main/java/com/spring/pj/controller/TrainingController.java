package com.spring.pj.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceTraining;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingFile;

@Controller
public class TrainingController {
    
    private static final Logger logger = LoggerFactory.getLogger(TrainingController.class);
    
    @Autowired // 인스턴스 생성
    IServiceTraining  srvboard;
    
   
    @RequestMapping(value = "pj_mn40/pj_mn41", method = RequestMethod.GET)
    public String pj_mn41(Model model,              
            @RequestParam(defaultValue = "1") Integer curPage,
            @RequestParam(defaultValue = "") String searchWord
            ,HttpServletRequest request
            , HttpSession session) {
        logger.info("pj_mn40/pj_mn41");
       
        int totalRecord = srvboard.getArticleTotalRecord(searchWord);
       
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        
        List<ModelTraining> result = srvboard.getArticleList(
                searchWord, start, end);
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("traininglist", result);     
        model.addAttribute("curPage", curPage);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("actionurl", request.getRequestURL().toString());
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("nextLink", paging.getNextLink());
        
        return "pj_mn40/pj_mn41"; // views / board / articlelist.jsp
    }
    
  
    @RequestMapping(value = "pj_mn40/pj_mn42", method = RequestMethod.GET)
    public String pj_mn42(Model model,              
            @RequestParam(defaultValue = "1") Integer curPage,
            @RequestParam(defaultValue = "") String searchWord
            ,HttpServletRequest request
            , HttpSession session) {
        logger.info("pj_mn40/pj_mn42");
       
           
        return "pj_mn40/pj_mn42"; // views / board / articlelist.jsp
    }
    
    @RequestMapping(value = "/pj_mn40/pj_mn43/{articleno}", method = RequestMethod.GET)
    public String articleview( Model model           
            , @PathVariable Integer articleno
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue="" ) String searchWord 
            , HttpServletRequest request) {
        logger.info("/pj_mn40/pj_mn43");
        
        // boardcd
        // articleno
        // curPage
        // searchWord
        
        model.addAttribute("articleno" , articleno  );
        model.addAttribute("curPage"   , curPage    );
        model.addAttribute("searchWord", searchWord );
        
      
        
        // thisArticle
        ModelTraining thisArticle = srvboard.transArticle(articleno);
        model.addAttribute("thisArticle", thisArticle);
        
        // attachFileList : 첨부파일을 출력하는 경우.
        List<ModelTrainingFile> attachFileList = srvboard.getAttachFileList(articleno);
        model.addAttribute("attachFileList", attachFileList);
        
       /* // commentList : 댓글 목록을 출력하는 경우.
        List<ModelComments> commentList = srvboard.getCommentList(articleno);
        model.addAttribute("commentList", commentList);
        */
        
        // nextArticle
        ModelTraining nextArticle = srvboard.getNextArticle(articleno, searchWord);
        model.addAttribute("nextArticle", nextArticle);
        
        // prevArticle
        ModelTraining prevArticle = srvboard.getPrevArticle(articleno,searchWord);
        model.addAttribute("prevArticle", prevArticle);
        
        
        // articleList
        // no
        // prevLink
        // pageLinks
        // nextLink
        int totalRecord = srvboard.getArticleTotalRecord( searchWord);
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end   = paging.getEndRecord();
        
        List<ModelTraining> articleList = srvboard.getArticleList(searchWord, start, end);
        
        model.addAttribute("articleList", articleList);        
        model.addAttribute("no", paging.getListNo() );    
        model.addAttribute("prevLink", paging.getPrevLink() );
        model.addAttribute("pageLinks", paging.getPageLinks() );
        model.addAttribute("nextLink", paging.getNextLink() );

        // actionurl
        String actionurl = request.getRequestURL().toString(); // 현재 실행되는 페이지 주소
        model.addAttribute("actionurl", actionurl );

        return "pj_mn40/pj_mn43"; // views / board / articleview.jsp
    }
    @RequestMapping(value = "/pj_mn40/pj_mn42", method = RequestMethod.POST)
    public String articlewrite( Model model
            , @ModelAttribute ModelTraining article
            , @RequestParam(value="upload" ) MultipartFile upload
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue=""  ) String searchWord ) {
        logger.info("/pj_mn40/pj_mn42 :: post");
        
        model.addAttribute("curPage"   , curPage);
        model.addAttribute("searchWord", searchWord);
        
        // 1. tb_bbs_article table insert. inserted pk 값을 반환 받는다.
        // 2. client의 파일을 server로 upload.
        // 3. tb_bbs_attachfile 테이블에 insert.
        
        // tb_bbs_article table insert. inserted pk 값을 반환 받는다.
        int insertedpk = srvboard.insertArticle(article);
        
        // client의 파일을 server로 upload.
        if( !upload.getOriginalFilename().isEmpty() ) {
            
            // 서버의 업로드 폴더 존재 여부 체크. 없으면 폴더 생성
            java.io.File uploadDir = new java.io.File( WebConstants.UPLOAD_PATH );
            if( !uploadDir.exists() ) uploadDir.mkdir();
            
            // 클라이언트의 파일을 서버로 복사
            String fileName = upload.getOriginalFilename();
            String tempName = LocalDateTime.now().format( DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            String newFile  = WebConstants.UPLOAD_PATH + tempName; // c:/upload/20180123115415
            java.io.File serverfile = new java.io.File( newFile );
            
            try {
                upload.transferTo( serverfile ); // 실제로 파일 카피 발생.
            } catch (IllegalStateException e) {
                logger.error("articlewrite" + e.getMessage() );
            } catch (IOException e) {
                logger.error("articlewrite" + e.getMessage() );
            }
            
            // 파일을 서버로 복사 성공 여부 체크. 
            // 성공한 경우만 tb_bbs_attachfile 테이블에 insert.
            if( serverfile.exists() ) {
                // 3. tb_bbs_attachfile 테이블에 insert.
                ModelTrainingFile attachFile = new ModelTrainingFile();
                attachFile.setArticleno( insertedpk );
                attachFile.setFilenameorig( fileName );
                attachFile.setFilenametemp( tempName );
                attachFile.setFilesize( serverfile.length() );
                attachFile.setFiletype( upload.getContentType() );
                
                int result = srvboard.insertAttachFile(attachFile);
            }
        }
        
        String url = String.format("redirect:/pj_mn40/pj_mn43/%s",  insertedpk );
        return url; 
    }
    
}

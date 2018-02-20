package com.spring.pj.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceTraining;
import com.spring.pj.inf.IServiceUser;
import com.spring.pj.model.ModelTraining;
import com.spring.pj.model.ModelTrainingApply;
import com.spring.pj.model.ModelTrainingFile;
import com.spring.pj.model.ModelUser;


@Controller
public class TrainingController {
    
    private static final Logger logger = LoggerFactory.getLogger(TrainingController.class);
    
    @Autowired 
    IServiceTraining  srvboard;
    @Autowired
    IServiceUser svruser;
   
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
        
        List<ModelTraining> result = srvboard.getArticleList(searchWord, start, end);
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("traininglist", result);     
        model.addAttribute("curPage", curPage);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("actionurl", request.getRequestURL().toString());
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("nextLink", paging.getNextLink());
        
        return "pj_mn40/pj_mn41"; 
    }
    
  
    @RequestMapping(value = "pj_mn40/pj_mn42", method = RequestMethod.GET)
    public String pj_mn42(Model model,              
            @RequestParam(defaultValue = "1") Integer curPage,
            @RequestParam(defaultValue = "") String searchWord
            ,HttpServletRequest request
            , HttpSession session) {
        logger.info("pj_mn40/pj_mn42");
       
           
        return "pj_mn40/pj_mn42";
    }
    
    @RequestMapping(value = "/pj_mn40/pj_mn43/{articleno}", method = RequestMethod.GET)
    public String articleview( Model model           
            , @PathVariable Integer articleno
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue="" ) String searchWord 
            , HttpServletRequest request
            /*, HttpSession session*/) {
        logger.info("/pj_mn40/pj_mn43");
    
        
        model.addAttribute("articleno" , articleno  );
        model.addAttribute("curPage"   , curPage    );
        model.addAttribute("searchWord", searchWord );
   
        ModelTraining thisArticle = srvboard.transArticle(articleno);
        model.addAttribute("thisArticle", thisArticle);
        

        List<ModelTrainingFile> attachFileList = srvboard.getAttachFileList(articleno);
        model.addAttribute("attachFileList", attachFileList);
        
      
        ModelTraining nextArticle = srvboard.getNextArticle(articleno, searchWord);
        model.addAttribute("nextArticle", nextArticle);
        
   
        ModelTraining prevArticle = srvboard.getPrevArticle(articleno,searchWord);
        model.addAttribute("prevArticle", prevArticle);
        
   
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

        String actionurl = request.getRequestURL().toString(); // 현재 실행되는 페이지 주소
        model.addAttribute("actionurl", actionurl );

        return "pj_mn40/pj_mn43"; // views / board / articleview.jsp
    }
    @RequestMapping(value = "/pj_mn40/pj_mn42", method = RequestMethod.POST)
    public String articlewrite( Model model
            , @ModelAttribute ModelTraining article
            , @RequestParam(value="upload" ) MultipartFile upload
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue=""  ) String searchWord 
            ) {
        logger.info("/pj_mn40/pj_mn42 :: post");
       
        
        model.addAttribute("curPage"   , curPage);
        model.addAttribute("searchWord", searchWord);        
        int insertedpk = srvboard.insertArticle(article);        
        if( !upload.getOriginalFilename().isEmpty() ) {           
            
            java.io.File uploadDir = new java.io.File( WebConstants.UPLOAD_PATH );
            if( !uploadDir.exists() ) uploadDir.mkdir();          
           
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
    @RequestMapping(value = "/pj_mn40/pj_mnDL", method = RequestMethod.POST)
    public String download( Model model ) {
        logger.info("/pj_mn40/pj_mnDL");
        
        return "/pj_mn40/pj_mnDL";
    }
    @RequestMapping(value = "/pj_mn40/pj_mnMD/{articleno}", method = RequestMethod.GET)
    public String articlemodify( Model model
            
            , @PathVariable Integer articleno
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue=""  ) String searchWord
            , HttpServletRequest request) {
        logger.info("/pj_mn40/pj_mnMD :: get ");
        model.addAttribute("actionurl" , request.getRequestURL().toString() );   
        model.addAttribute("articleno" , articleno                      );
        model.addAttribute("curPage"   , curPage                        );
        model.addAttribute("searchWord", searchWord                     );
        model.addAttribute("thisArticle"   , srvboard.getArticle(articleno)       );
        model.addAttribute("attachFileList", srvboard.getAttachFileList(articleno));
        
        return "pj_mn40/pj_mnMD";
    }
         
    @RequestMapping(value = "/pj_mn40/pj_mnMD/{articleno}", method = RequestMethod.POST)
    public String articlemodify( Model model
            , @ModelAttribute ModelTraining setValue
            , @RequestParam(value="upload" ) MultipartFile upload
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue=""  ) String searchWord ) {
        logger.info("/pj_mn40/pj_mnMD :: post");
        
       
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
                attachFile.setArticleno( setValue.getArticleno()  );
                attachFile.setFilenameorig( fileName );
                attachFile.setFilenametemp( tempName );
                attachFile.setFilesize( serverfile.length() );
                attachFile.setFiletype( upload.getContentType() );
                
                int result = srvboard.insertAttachFile(attachFile);
            }
        }
        
        
        ModelTraining whereValue = new ModelTraining(  setValue.getArticleno() );
        int result = srvboard.updateArticle(setValue, whereValue);
        
        String url = String.format("redirect:/pj_mn40/pj_mn43/%s"
                                       , setValue.getArticleno() );
        return url; 
    }
    

    
    @RequestMapping(value = "/pj_mn40/articledelete", method = RequestMethod.POST)
    public String articledelete( Model model
           
            , @RequestParam Integer articleno
            , @RequestParam(defaultValue="1" ) Integer curPage
            , @RequestParam(defaultValue=""  ) String searchWord
            , RedirectAttributes rttr ) {
        logger.info("/pj_mn40/articledelete :: post");
        
        ModelTraining tra = new ModelTraining();
        tra.setArticleno(articleno);
        
        int result = srvboard.deleteArticle(tra); // model 자체를 넘겨받음.
        
        String url = "";
        if( result == 1) {            
            url = String.format("redirect:/pj_mn40/pj_mn41?curPage=%s&searchWord=%s" , curPage, searchWord );
        }
        else {
          
            rttr.addAttribute("curPage"   , curPage);
            rttr.addAttribute("searchWord", searchWord);
            
            url = String.format("redirect:/pj_mn40/pj_mn43/%s",  articleno);
        }
        return url;
    }
    
    @RequestMapping(value = "/pj_mn40/deleteattachfile", method = RequestMethod.POST)
    @ResponseBody
    public int deleteattachfile( Model model
            , @RequestParam Integer attachfileno ) {
        logger.info("/pj_mn40/deleteattachfile :: post");        
        ModelTrainingFile attachFile = new ModelTrainingFile(attachfileno);        
        int result = srvboard.deleteAttachFile(attachFile);        
        return result; 
    }
    
    @RequestMapping(value = "/rest/pj_mn40/pj_mn43/insertapply", method = RequestMethod.POST)
    @ResponseBody 
    public int restinsertapply(Model model
            , HttpSession session
            , @RequestParam Integer articleno
           ) {
        logger.info("/rest/pj_mn40/pj_mn43/insertapply");
        
        ModelUser user = (ModelUser) session.getAttribute("user");
        Integer userno = user.getUserno();
        
        ModelTrainingApply apply = srvboard.selectTraingApplyOne(articleno, userno);
        
        if (apply == null) { //111111111111
            apply = new ModelTrainingApply();
            apply.setArticleno(articleno);
            apply.setUserno(userno);
            int result = srvboard.insertTrainingApply(apply);
            return result; // 111111111111
        }
        else {
            return 0;
        }
    }
    
    @RequestMapping(value = "/pj_mn40/deleteapply", method = RequestMethod.POST)
    public String deleteapply( Model model
           
            , @RequestParam Integer articleno
            , @RequestParam(defaultValue="1" ) Integer curPage
            
            , RedirectAttributes rttr ) {
        logger.info("/pj_mn40/deleteapply :: post");
        
        ModelTrainingApply tra = new ModelTrainingApply();
        tra.setArticleno(articleno);
        
        int result = srvboard.deleteTrainingApply(tra); // model 자체를 넘겨받음.
        
        String url = "";
        if( result == 1) {            
            url = String.format("redirect:/pj_mn40/pj_mn41?curPage=%s" , curPage);
        }
        else {
           /* rttr.addFlashAttribute("msg"  , WebConstants.MSG_FAIL_DELETE_ARTICLE );*/
            rttr.addAttribute("curPage"   , curPage);
            
            
            url = String.format("redirect:/pj_mn40/pj_mn43/%s",  articleno);
        }
        return url;
}
}

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceEmploy;
import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelEmployUserFile;
import com.spring.pj.model.ModelUser;



@Controller
public class EmployController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployController.class);
	@Autowired
    IServiceEmploy svremp;
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn21_jobs", method = RequestMethod.GET)
    public String pj_mn21_jobs_get( Model model
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            , HttpSession session
            ) {
        logger.info("/pj_mn20/pj_mn21_jobs  :g");
        
        int totalRecord = svremp.getEmployTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user == null || user.getUserclass() >1){
        }
        else{
            model.addAttribute("mgs",user.getUserclass());
        }
        List<ModelEmploy> rs = svremp.getEmployList(searchWord, start, end);
        List<ModelEmploy> select =svremp.selectDetpName();
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("detpname", select);
        model.addAttribute("deptlist",rs);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("curPage", curPage);
        model.addAttribute("nextLink", paging.getNextLink());
        
        return "pj_mn20/pj_mn21_jobs";
    }
	
	@RequestMapping(value = "/pj_mn20/pj_mn21_jobs", method = RequestMethod.POST)
    public String pj_mn21_jobs( Model model
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            , HttpSession session
            ) {
        logger.info("/pj_mn20/pj_mn21_jobs");
        
        int totalRecord = svremp.getEmployTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if(user == null || user.getUserclass() >1){
            
        }
        else{
            model.addAttribute("mgs",user.getUserclass());
        }
        List<ModelEmploy> select =svremp.selectDetpName();
        List<ModelEmploy> rs = svremp.getEmployList(searchWord, start, end);
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("detpname", select);
        model.addAttribute("deptlist",rs);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("curPage", curPage);
        model.addAttribute("nextLink", paging.getNextLink());
        
        return "pj_mn20/pj_mn21_jobs";
    }
	
	@RequestMapping(value = "/pj_mn20/pj_mn22_view", method = RequestMethod.POST)
    public String pj_mn22( Model model , HttpSession session
                                                    , @RequestParam String title
                                                    , @RequestParam Integer detpno ) {
        logger.info("/pj_mn20/pj_mn22_view");
        
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("jobtitle", title);
        model.addAttribute("detpno", detpno);
        
        
         return "pj_mn20/pj_mn22_view";
    }
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn23", method = RequestMethod.POST)
    public String pj_mn23( Model model, HttpSession session
                                                                    , @RequestParam String title
                                                                    , @RequestParam Integer detpno) {
        logger.info("/pj_mn20/pj_mn23");
        
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("jobtitle", title);
        model.addAttribute("detpno", detpno);
       ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
       if (user == null) {
           return "pj_mn20/pj_mn23";
       }
       else {
           model.addAttribute("user",user);
           return "pj_mn20/pj_mn23";
       }
    }
   @RequestMapping(value = "/pj_mn20/insertuploaduser", method = RequestMethod.POST)
	    public String  insertuploaduser( Model model
	                                                            , HttpSession session
	                                                            ,@RequestParam(value="upload") MultipartFile upload
	                                                            ,@ModelAttribute ModelEmployUserFile insert
	                                                            , @RequestParam (defaultValue="@")String email) {
	        logger.info("/pj_mn20/insertuploaduser");
	        
	       
	        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
	        // user 가 아닌사람이 지원할때
	        if (user == null) {
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
	                    logger.error("insertuploaduser" + e.getMessage() );
	                } catch (IOException e) {
	                    logger.error("insertuploaduser" + e.getMessage() );
	                }
	                
	                // 파일을 서버로 복사 성공 여부 체크. 
	                // 성공한 경우만 테이블에 insert.
	                if( serverfile.exists() ) {

	                    String mail = insert.getMail()+"@"+email;
	                    ModelEmployUserFile attachFile = new ModelEmployUserFile();
	                    attachFile.setDetpno(insert.getDetpno());
	                    attachFile.setName(insert.getName());
	                    attachFile.setPhone(insert.getPhone());
	                    attachFile.setMail(mail);
	                    attachFile.setAddress(insert.getAddress());
	                    attachFile.setUrl(insert.getUrl());
	                    attachFile.setFileNameOrig( fileName );
	                    attachFile.setFileNameTemp( tempName );
	                    attachFile.setFileSize( serverfile.length() );
	                    attachFile.setContentType( upload.getContentType() );
	                    
	                    int rs = svremp.insertuploaduser(attachFile);
	                }
	              
	            }else{
	                String mail = insert.getMail()+"@"+email;
	                insert.setMail(mail);
	                int rs = svremp.insertuploaduser(insert);
	                }
	        }
	           // user 가 지원할때 
	        else {
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
	                    logger.error("insertuploaduser" + e.getMessage() );
	                } catch (IOException e) {
	                    logger.error("insertuploaduser" + e.getMessage() );
	                }
	                
	                // 파일을 서버로 복사 성공 여부 체크. 
	                // 성공한 경우만 테이블에 insert.
	                if( serverfile.exists() ) {
	                    ModelEmployUserFile attachFile = new ModelEmployUserFile();
	                    attachFile.setDetpno(insert.getDetpno());
	                    attachFile.setName(user.getName());
	                    attachFile.setPhone(user.getMobile());
	                    attachFile.setMail(user.getEmail());
	                    attachFile.setAddress(user.getAddress());
	                    attachFile.setUrl(insert.getUrl());
	                    attachFile.setFileNameOrig( fileName );
	                    attachFile.setFileNameTemp( tempName );
	                    attachFile.setFileSize( serverfile.length() );
	                    attachFile.setContentType( upload.getContentType() );
	                    
	                    int rs = svremp.insertuploaduser(attachFile);
	                }
	              
	            }else{
	                
	                insert.setName(user.getName());
	                insert.setPhone(user.getMobile());
	                insert.setMail(user.getEmail());
	                insert.setAddress(user.getAddress());
	                int rs = svremp.insertuploaduser(insert);
	                }
	            
	        }
	        
	        
	        /*if( !upload.getOriginalFilename().isEmpty() ) {
	            
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
	                logger.error("insertuploaduser" + e.getMessage() );
	            } catch (IOException e) {
	                logger.error("insertuploaduser" + e.getMessage() );
	            }
	            
	            // 파일을 서버로 복사 성공 여부 체크. 
	            // 성공한 경우만 테이블에 insert.
	            if( serverfile.exists() ) {

	                String mail = insert.getMail()+"@"+email;
	                ModelEmployUserFile attachFile = new ModelEmployUserFile();
	                attachFile.setDetpno(insert.getDetpno());
	                attachFile.setName(insert.getName());
	                attachFile.setPhone(insert.getPhone());
	                attachFile.setMail(mail);
	                attachFile.setAddress(insert.getAddress());
	                attachFile.setUrl(insert.getUrl());
	                attachFile.setFileNameOrig( fileName );
	                attachFile.setFileNameTemp( tempName );
	                attachFile.setFileSize( serverfile.length() );
	                attachFile.setContentType( upload.getContentType() );
	                
	                int rs = svremp.insertuploaduser(attachFile);
	            }
	          
	        }else{
	            String mail = insert.getMail()+"@"+email;
	            insert.setMail(mail);
                int rs = svremp.insertuploaduser(insert);
                }*/
	         return "redirect:/pj_mn20/pj_mn21_jobs";
	   }
   
	  
	@RequestMapping(value = "/pj_mn20/pj_mn24_filelist", method = RequestMethod.GET)
    public String pj_mn24_filelist( Model model
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            , HttpSession session
            ) {
        logger.info("/pj_mn20/pj_mn24_filelist  :g");
        int totalRecord = svremp.getEmployTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        List<ModelEmployUserFile> empfile = svremp.selectuploaduser();
        for (ModelEmployUserFile i : empfile) {
            ModelEmploy emp = svremp.selectDetpno(i.getDetpno());
            i.setEmp(emp);
        }
        model.addAttribute("empfilelist", empfile);
        
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        
        
        if( user.getUserclass() > 1){
            // 권한 없음 메세지 띄우기 
            return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            return "pj_mn20/pj_mn24_filelist";
        }
    }
	@RequestMapping(value = "/pj_mn20/deletefile", method = RequestMethod.POST)
	@ResponseBody
    public int deletefile( Model model
            , HttpSession session
            , @ModelAttribute ModelEmployUserFile deletefile
            ) {
        logger.info("/pj_mn20/deletefile  :g");
       
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        
        
        if( user.getUserclass() >0){
            // 권한 없음 메세지 띄우기
            return 0;
        }
        else{
            int rs =svremp.deleteuploaduser(deletefile);
            return rs;
           
        }
    }
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn21write", method = RequestMethod.GET)
    public String pj_mn21write( Model model , HttpSession session) {
        logger.info("/pj_mn20/pj_mn21write");
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        List<ModelEmploy> select =svremp.selectDetpName();
        model.addAttribute("detpname", select);
        if( user.getUserclass() >0){
            // 권한 없음 메세지 띄우기             
            return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            return "pj_mn20/pj_mn21write";
        }
    }
	
	@RequestMapping(value = "/pj_mn20/pj_mn21write", method = RequestMethod.POST)
    public String pj_mn21write( Model model , HttpSession session,
                                                                @ModelAttribute ModelEmploy empbbs) {
        logger.info("/pj_mn20/pj_mn21write:post");
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        
        
        int result = svremp.insertEmploy(empbbs);
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        List<ModelEmploy> select =svremp.selectDetpName();
        model.addAttribute("detpname", select);
       
        
        return "redirect:/pj_mn20/pj_mn21_jobs";
    }
	
	
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn21modify/{detpno}", method = RequestMethod.GET)
    public String pj_mn21modify( Model model , HttpSession session, @PathVariable Integer detpno) {
        logger.info("/pj_mn20/pj_mn21modify :get");
       
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelEmploy deptno = svremp.selectDetpno(detpno);
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        model.addAttribute("detp", deptno);
        if( user.getUserclass() >0){
            // 권한 없음 메세지 띄우기             
            return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            return "pj_mn20/pj_mn21modify";
        }
    }
	@RequestMapping(value = "/pj_mn20/pj_mn21modify", method = RequestMethod.POST)
    public String pj_mn21modifypost( Model model , HttpSession session
                                                                        , @ModelAttribute ModelEmploy emp
                                                                        , RedirectAttributes rttr) {
        logger.info("/pj_mn20/pj_mn21modify :post");
       
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
       
       int rs =svremp.updateEmploy(emp);
       
        if( rs >0){
            return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            rttr.addFlashAttribute("msg", WebConstants.MSG_FAIL_UPDATE);
            return "redirect:/pj_mn20/pj_mn21modify";
        }
    }
	
	@RequestMapping(value = "/pj_mn20/delete", method = RequestMethod.POST)
     public String delete( Model model , HttpSession session
                                                                        , @ModelAttribute ModelEmploy emp
                                                                        , RedirectAttributes rttr) {
        logger.info("/pj_mn20/delete :post");
       
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
       
       int rs =svremp.deleteEmploy(emp);
       
        if( rs >0){
        return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            rttr.addFlashAttribute("msg", WebConstants.MSG_FAIL_DELETE);
            return "redirect:/pj_mn20/pj_mn21modify";
        }
    }
	
	@RequestMapping(value = "/download", method = RequestMethod.POST)
    public String download( Model model ) {
        logger.info("/download");
        
        return "pj_mn20/download"; 
    }
	
}

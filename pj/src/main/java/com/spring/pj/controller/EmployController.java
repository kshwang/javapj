package com.spring.pj.controller;

import java.util.List;
import java.util.Map;

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
        if(user == null || user.getUserclass() >0){
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
        if(user == null || user.getUserclass() >0){
            
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
    public String pj_mn22( Model model , HttpSession session, @RequestParam String title) {
        logger.info("/pj_mn20/pj_mn22_view");
        
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("jobtitle", title);
        
         return "pj_mn20/pj_mn22_view";
    }
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn23", method = RequestMethod.POST)
    public String pj_mn23( Model model, HttpSession session , @RequestParam String title) {
        logger.info("/pj_mn20/pj_mn23");
        
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("jobtitle", title);
       ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
       if (user == null) {
           return "pj_mn20/pj_mn23";
       }
       else {
           model.addAttribute("user",user);
           return "pj_mn20/pj_mn23";
       }
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
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        
        
        if( user.getUserclass() >0){
            // 권한 없음 메세지 띄우기 
            return "redirect:/pj_mn20/pj_mn21_jobs";
        }
        else{
            return "pj_mn20/pj_mn24_filelist";
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
	
	
}

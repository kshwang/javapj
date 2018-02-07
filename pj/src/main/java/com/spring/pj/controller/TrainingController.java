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
import com.spring.pj.model.ModelComments;
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
}

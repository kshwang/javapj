package com.spring.pj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceEmploy;
import com.spring.pj.model.ModelEmploy;
import com.spring.pj.model.ModelQnaBoard;

@Controller
public class EmployController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployController.class);
	@Autowired
    IServiceEmploy svremp;
	
	
	@RequestMapping(value = "/pj_mn20/pj_mn21", method = RequestMethod.GET)
    public String pj_mn21( Model model
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            , HttpSession session
            ) {
        logger.info("/pj_mn20/pj_mn21");
        
        int totalRecord = svremp.getEmployTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        
        List<ModelEmploy> rs = svremp.getEmployList(searchWord, start, end);
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("emplist",rs);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("curPage", curPage);
        model.addAttribute("nextLink", paging.getNextLink());
        return "pj_mn20/pj_mn21";
    }
<<<<<<< HEAD
	@RequestMapping(value = "/pj_mn20/pj_mn22_view", method = RequestMethod.GET)
    public String pj_mn22( Model model) {
        logger.info("/pj_mn20/pj_mn22");
     
        return "pj_mn20/pj_mn22_view";
    }
	@RequestMapping(value = "/pj_mn20/pj_mn23", method = RequestMethod.GET)
    public String pj_mn23( Model model) {
        logger.info("/pj_mn20/pj_mn23");
     
        return "pj_mn20/pj_mn23";
=======
	@RequestMapping(value = "/pj_mn20/pj_mn22", method = RequestMethod.GET)
    public String pj_mn22( Model model) {
        logger.info("/pj_mn20/pj_mn22");
     
        return "pj_mn20/pj_mn22";
>>>>>>> 704a94892a65fd7311bfd2c11987dafa7ec4291b
    }
    
    
}

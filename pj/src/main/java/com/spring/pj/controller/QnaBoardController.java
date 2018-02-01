package com.spring.pj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.inf.IServiceQnaBoard;
import com.spring.pj.model.ModelQnaBoard;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QnaBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	IServiceQnaBoard svrboard;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "pj_mn30/pj_mn31", method = RequestMethod.GET)
    public String pj_mn31( Model model
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            ) {
        logger.info("pj_mn30/pj_mn31");
        
        int totalRecord = svrboard.getQnaBoardTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        
        List<ModelQnaBoard> rs = svrboard.getQnaList(searchWord, start, end);
        model.addAttribute("boardlist", rs);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("curPage", curPage);
        model.addAttribute("nextLink", paging.getNextLink());
        return "pj_mn30/pj_mn31";
    }
	
	@RequestMapping(value = "pj_mn30/pj_mn32", method = RequestMethod.GET)
    public String pj_mn32( Model model) {
        logger.info("/pj_mn30/pj_mn32");
        return "pj_mn30/pj_mn32";
    }
	
}

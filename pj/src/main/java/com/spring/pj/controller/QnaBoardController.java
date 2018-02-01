package com.spring.pj.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.pj.common.PagingHelper;
import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceQnaBoard;
import com.spring.pj.model.ModelQnaBoard;
import com.spring.pj.model.ModelUser;

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
            , HttpSession session
            ) {
        logger.info("pj_mn30/pj_mn31");
        
        int totalRecord = svrboard.getQnaBoardTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        
        List<ModelQnaBoard> rs = svrboard.getQnaList(searchWord, start, end);

        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("boardlist", rs);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("curPage", curPage);
        model.addAttribute("nextLink", paging.getNextLink());
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("url", request.getRequestURL().toString());
        return "pj_mn30/pj_mn31";
    }
	
	@RequestMapping(value = "pj_mn30/pj_mn32", method = RequestMethod.GET)
    public String pj_mn32( Model model) {
        logger.info("/pj_mn30/pj_mn32");
        return "pj_mn30/pj_mn32";
    }
	
	@RequestMapping(value = "pj_mn30/pj_mn31view/{bno}", method = RequestMethod.GET)
    public String pj_mn31view( Model model
            , @PathVariable Integer bno 
            , @RequestParam(defaultValue="1") Integer curPage
            , @RequestParam(defaultValue="") String searchWord
            , HttpServletRequest request
            , HttpSession session) {
        logger.info("/pj_mn30/pj_mn31_view");
        
        // searchWord
        // boardcd
        // articleno
        // curPage
        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        model.addAttribute("bno",bno);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("curPage", curPage);
        ModelQnaBoard board = svrboard.getQna(bno);
        model.addAttribute("board", board);
        
        /*// commentList --> 댓글 목록을 출력하는 경우.
        List<ModelComments> commentList = srvboard.getCommentList(articleno);
        model.addAttribute("commentList", commentList);*/
        // nextArticle
        ModelQnaBoard nextQna = svrboard.getNextQna(bno, searchWord);
        model.addAttribute("nextQna", nextQna);
        // prevArticle
        ModelQnaBoard prevQna = svrboard.getPrevQna(bno, searchWord);
        model.addAttribute("prevQna", prevQna);
        // articleList
        // no
        // prevPage
        // pageLinks
        // nextLink
        int totalRecord = svrboard.getQnaBoardTotalRecord(searchWord);
        
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
        List<ModelQnaBoard> boardlist = svrboard.getQnaList(searchWord, start, end);
        model.addAttribute("boardlist", boardlist);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("PrevLink", paging.getPrevLink());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("nextLink", paging.getNextLink());

        // actionurl
        String url = request.getRequestURL().toString();
        model.addAttribute("url", url);
        return "pj_mn30/pj_mn31view";
    }
	

    @RequestMapping(value = "pj_mn30/pj_mn31write", method = RequestMethod.GET)
    public String pj_mn31write( Model model
            , HttpSession session) {
        logger.info("/pj_mn30/pj_mn31write");
        

        model.addAttribute(WebConstants.SESSION_NAME, session.getAttribute(WebConstants.SESSION_NAME));
        
        return "pj_mn30/pj_mn31write";
    }


    @RequestMapping(value = "pj_mn30/pj_mn31write", method = RequestMethod.POST)
    public String pj_mn31write( Model model
            , @RequestParam(value="title") String title
            , @RequestParam(value="content") String content
            , HttpSession session) {
        logger.info("/pj_mn30/pj_mn31write");
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        long date = new Date().getTime();
        
        java.sql.Date updatedt = new java.sql.Date(date);
        
        ModelQnaBoard qna = new ModelQnaBoard(null, title, content, user.getUserid(), null, updatedt, null, null);
        
        int rs = svrboard.insertQna(qna);
        
        
        return "redirect:/pj_mn30/pj_mn31view/" + qna.getBno();
    }
    
}

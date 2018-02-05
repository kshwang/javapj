package com.spring.pj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pj.common.WebConstants;
import com.spring.pj.inf.IServiceUser;
import com.spring.pj.model.ModelQuestionForPW;
import com.spring.pj.model.ModelUser;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	IServiceUser srvuser;
	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        logger.info("login:get");
        
        return "login";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model model, @RequestParam String userid,
                                     @RequestParam String passwd,
                                     HttpSession session,
                                     RedirectAttributes rttr) {
        logger.info("/login : post");
        
        ModelUser result = srvuser.login(userid, passwd);
        
        if (result != null) {
            // 로그인 성공
            session.setAttribute(/* 세션명 */WebConstants.SESSION_NAME, /* 세션 */result);
            
            
            return "redirect:/"; // --> http://localhost:8080 페이지가 열림
        }
        else {
//            // 로그인 실패
//            // RedirectAttributes는 redirect시 사용되는 변수를 전달할 때 사용되는 객체다.
            rttr.addFlashAttribute("msg", "로그인 실패");
//            rttr.addFlashAttribute("url", url);
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model, HttpSession session) {
       logger.info("logout");
       
       session.removeAttribute(WebConstants.SESSION_NAME);
       
       return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        logger.info("register:get");
        
        List<ModelQuestionForPW> q = srvuser.getQuestionForPW();
        
        model.addAttribute("q_for_pw", q);
        
        return "register";
    }
    
    @RequestMapping(value = "/rest/checkuserid", method = RequestMethod.POST)
    @ResponseBody
    public int checkuserid(String userid) {
        logger.info("/rest/checkuserid");
        
        return srvuser.checkuserid(userid);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model
            , @RequestParam String userid
            , @RequestParam String passwd
            , @RequestParam Integer q_no
            , @RequestParam String q_answer
            , @RequestParam String name
            , @RequestParam String address
            , @RequestParam String email
            , @RequestParam String mobile
            , @RequestParam Integer userclass) {
        logger.info("register:post");
        
        ModelUser user = new ModelUser();
        user.setUserid(userid);
        user.setPasswd(passwd);
        user.setName(name);
        user.setAddress(address);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setQ_no(q_no);
        user.setQ_answer(q_answer);
        user.setUserclass(userclass);
        
        srvuser.insertUser(user);
        
        return "redirect:/";
    }
    
    @RequestMapping(value = "/findid", method = RequestMethod.GET)
    public String findid(Model model) {
        logger.info("findpw:get");
        
        return "finduserinfo/findid";
    }
    
    @RequestMapping(value = "/findid", method = RequestMethod.POST)
    public String findid(Model model
            , @RequestParam String name
            , @RequestParam String email
            , @RequestParam String mobile
            , RedirectAttributes rttr) {
        logger.info("findid:post");
        
        ModelUser user = new ModelUser();
        user.setName(name);
        user.setEmail(email);
        user.setMobile(mobile);
        
        ModelUser result = srvuser.selectUserOne(user);
        
        if (result == null) {
            rttr.addFlashAttribute("msg", "아이디 찾기 실패");
            return "redirect:/findid";
        }
        else {
            model.addAttribute("result", result);
            return "finduserinfo/findidresult";
        }
    }
    
    @RequestMapping(value = "/findpw", method = RequestMethod.GET)
    public String findpw(Model model) {
        logger.info("findpw:get");
        
        List<ModelQuestionForPW> q = srvuser.getQuestionForPW();
        
        model.addAttribute("q_for_pw", q);
        
        return "finduserinfo/findpw";
    }
    
    @RequestMapping(value = "/findpw", method = RequestMethod.POST)
    public String findpw(Model model
            , @RequestParam String userid
            , @RequestParam Integer q_no
            , @RequestParam String q_answer
            , RedirectAttributes rttr) {
        logger.info("findpw:post");
        
        ModelUser user = new ModelUser();
        user.setUserid(userid);
        user.setQ_no(q_no);
        user.setQ_answer(q_answer);
        
        ModelUser result = srvuser.selectUserOne(user);
        
        if (result == null) {
            rttr.addFlashAttribute("msg", "비밀번호질문 또는 답변이 틀렸습니다.");
            return "redirect:/findpw";
        }
        else {
            model.addAttribute("result", result);
            return "finduserinfo/findpwresult";
        }
    }
    
    
}

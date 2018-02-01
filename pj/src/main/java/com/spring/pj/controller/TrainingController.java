package com.spring.pj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrainingController {
	
	private static final Logger logger = LoggerFactory.getLogger(TrainingController.class);
	
	@RequestMapping(value = "pj_mn40/pj_mn41", method = RequestMethod.GET)
	public String pj_mn41(Model model) {
		logger.info("pj_mn40/pj_mn41");
		
		return "pj_mn40/pj_mn41";
	}
	   @RequestMapping(value = "pj_mn40/pj_mn42", method = RequestMethod.GET)
	    public String pj_mn42(Model model) {
	        logger.info("pj_mn40/pj_mn42");
	        
	        return "pj_mn40/pj_mn42";
	    }
}

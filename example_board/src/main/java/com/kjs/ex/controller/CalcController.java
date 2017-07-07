package com.kjs.ex.controller;

import java.text.DecimalFormat;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kjs.ex.service.CalcService;
import com.kjs.ex.vo.CalcVO;

@Controller
@RequestMapping("")
public class CalcController {
	
	private static final Logger logger = LoggerFactory.getLogger(CalcController.class);
	
	@Inject
	private CalcService service;
	
	@RequestMapping(value = "/calc", method = RequestMethod.GET)
	public void registerGET(Model model) throws Exception {
		
		logger.info("register get ................");
		
	}
	
	@RequestMapping(value = "/calc", method = RequestMethod.POST)
	public String registerPOST(CalcVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post ...................");
		logger.info(vo.toString());
		try {
			if(vo.getResult() != null){
				service.insert(vo);
			}
			DecimalFormat df = new DecimalFormat("#.###############");
			Double result = vo.getResult();
			rttr.addFlashAttribute("result", df.format(result));
			rttr.addFlashAttribute("formula", vo.getFormula());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/calc";
		
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(CalcVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("delete post.....................");

		try {
			service.delete(vo);
			rttr.addFlashAttribute("msg", "clear");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/calc";
	}

}
















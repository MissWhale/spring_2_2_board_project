package com.inhatc.board;

import java.util.HashMap;


import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.inhatc.domain.RegisterVO;
import com.inhatc.service.RegisterService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisterController {
	
	@Inject
	RegisterService service;
	
	@RequestMapping(value = "/login/register", method = RequestMethod.GET)
	public void login() {
	}
	
	@RequestMapping(value = "/login/register", method = RequestMethod.POST)
	public String register(RegisterVO vo, Model model, RedirectAttributes rttr) throws Exception {
		int result=service.register(vo);
		if(result==1){
			rttr.addFlashAttribute("success","success");
			 return "redirect:/login/login";
		}else{
			model.addAttribute("success","fail");
			return "/login/register";	
		}
	}	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public @ResponseBody Object idcheck(Model model, RegisterVO vo) throws Exception {
		int result = service.getid(vo);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public @ResponseBody Object emailcheck(Model model, RegisterVO vo) throws Exception {
		int result = service.getemail(vo);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}		
	@RequestMapping(value = "/idfind", method = RequestMethod.POST)
	public @ResponseBody Object findid(Model model, RegisterVO vo) throws Exception {
		RegisterVO id = service.findid(vo);
		if(id==null){
			return null;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", id.getId());
		return paramMap;
	}
	@RequestMapping(value = "/pwfind", method = RequestMethod.POST)
	public @ResponseBody Object findpw(Model model, RegisterVO vo) throws Exception {
		RegisterVO pw = service.findpw(vo);
		if(pw==null){
			return null;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", pw.getPw());
		return paramMap;
	}
}
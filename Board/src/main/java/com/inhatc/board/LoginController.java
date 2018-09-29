package com.inhatc.board;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

import com.inhatc.domain.LoginVO;
import com.inhatc.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Inject
	LoginService service;
	
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public void login() {
	}
	
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String login_check(Model model, LoginVO vo, HttpSession session) {
		// System.out.println("id"+vo.getId().isEmpty());
		// if(vo.getId().isEmpty()){
		// 	model.addAttribute("check", "noid");
		// 	return "/login/login";	
		// }else if(vo.getPw().isEmpty()){
		// 	model.addAttribute("check", "nopw");
		// 	return "/login/login";
		// }
		boolean result = service.login_check(vo.getId(), vo.getPw());
		System.out.println("°á°ú"+result);
		if(result)
		{
			session.setAttribute("id", vo.getId());
			return "redirect:/";
		}
		else
		{
			model.addAttribute("check", "no");
			return "/login/login";			
		}
	}	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/";
		
	}	
}
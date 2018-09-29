package com.inhatc.board;

import java.util.HashMap;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
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
			System.out.println("ȸ�����Լ���");
			rttr.addFlashAttribute("success","success");
			 return "redirect:/login/login";
		}else{
			System.out.println("ȸ�����Խ���");
			model.addAttribute("success","fail");
			return "/login/register";	
		}
	}	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public @ResponseBody Object idcheck(Model model, RegisterVO vo) throws Exception {
		System.out.println("��Ʈ�ѷ�"+vo.getId());
		int result = service.getid(vo);
		System.out.println("��Ʈ�ѷ�"+result);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public @ResponseBody Object emailcheck(Model model, RegisterVO vo) throws Exception {
		System.out.println("��Ʈ�ѷ�"+vo.getId());
		int result = service.getemail(vo);
		System.out.println("��Ʈ�ѷ�"+result);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}		
	@RequestMapping(value = "/idfind", method = RequestMethod.POST)
	public @ResponseBody Object findid(Model model, RegisterVO vo) throws Exception {
		System.out.println("��Ʈ�ѷ� name:"+vo.getName()+"�̸���:"+vo.getEmail());
		RegisterVO id = service.findid(vo);
		System.out.println("�����ֱ�"+id);
		if(id==null){
			return null;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", id.getId());
		System.out.println("�����ֱ�"+id.getId());
		return paramMap;
	}
	@RequestMapping(value = "/pwfind", method = RequestMethod.POST)
	public @ResponseBody Object findpw(Model model, RegisterVO vo) throws Exception {
		System.out.println("��Ʈ�ѷ� name:"+vo.getName()+" �̸���:"+vo.getEmail()+" ���̵�:"+vo.getId());
		RegisterVO pw = service.findpw(vo);
		System.out.println("�����ֱ�"+pw);
		if(pw==null){
			return null;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", pw.getPw());
		System.out.println("�����ֱ�"+pw.getId());
		return paramMap;
	}
}
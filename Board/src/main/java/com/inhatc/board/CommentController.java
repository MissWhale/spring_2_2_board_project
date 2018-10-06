package com.inhatc.board;


import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inhatc.domain.CommentVO;
import com.inhatc.service.CommentService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class CommentController {
	
	
	@Inject
	CommentService service;
	
	@RequestMapping(value = "/commentInput", method = RequestMethod.POST)
	public @ResponseBody Object commentInput(Model model, CommentVO vo, HttpSession session) throws Exception {
		vo.setId(session.getAttribute("id").toString());
		int result = service.commentInsert(vo);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}	
	
	@RequestMapping(value = "/commentDelete", method = RequestMethod.POST)
	public @ResponseBody Object commentDelete(Model model, CommentVO vo) throws Exception {
		int result = service.commentDelete(vo.getCom_no());
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}	
	
	@RequestMapping(value = "/commentModify", method = RequestMethod.POST)
	public @ResponseBody Object commentModify(Model model, CommentVO vo) throws Exception {
		int result = service.commentUpdate(vo.getCom_no(), vo.getCom_cont(),vo.getCom_code());
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("result", result);
		return paramMap;
	}		
}
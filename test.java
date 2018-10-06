package com.inhatc.board;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inhatc.domain.BoardVO;
import com.inhatc.domain.Criteria;
import com.inhatc.domain.LoginVO;
import com.inhatc.domain.Search;
import com.inhatc.service.BoardService;
import com.inhatc.service.CommentService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
   
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Inject
   BoardService service;
   
   @Inject
   CommentService com_service;
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String main(Model model, Criteria cri, Search sch, HttpSession session) throws Exception {
      cri.setSizeOfPage(10);
      cri.setNumberOfRecords(service.searchBoardCount(sch));
      cri.makePaging();
      if(session.getAttribute("id") != null) {
         model.addAttribute("session", "yes");
      }            model.addAttribute("page", service.search(sch, cri));
      model.addAttribute("pager", cri);
      model.addAttribute("search", sch);
      return "board/main";
   }
   
   @RequestMapping(value = "/board/board", method = RequestMethod.GET)
   public String boardSearch(Model model, Criteria cri, Search sch, HttpSession session) throws Exception {
      cri.setSizeOfPage(10);
      cri.setNumberOfRecords(service.searchBoardCount(sch));
      cri.makePaging();
      if(session.getAttribute("id") != null)
         model.addAttribute("session", "yes");
      model.addAttribute("page", service.search(sch, cri));
      model.addAttribute("pager", cri);
      model.addAttribute("search", sch);
      return "/board/board";
   }   
   
   @RequestMapping(value = "/board/read", method = RequestMethod.GET)
   public void read(Model model, @RequestParam("bno") int bno, Criteria cri, Search sch) throws Exception {
      logger.info("뷰페이지");
      service.add_hits(bno);
      model.addAttribute("post", service.read(bno));
      model.addAttribute("comment", com_service.commentSearch(bno));
      model.addAttribute("cri", cri);
      model.addAttribute("search", sch);
   }
   
   @RequestMapping(value = "/board/modify", method = RequestMethod.GET)
   public void modify(Model model, @RequestParam("bno") int bno, Criteria cri, Search sch) throws Exception {
      logger.info("수정페이지");
      model.addAttribute("post", service.read(bno));
      model.addAttribute("cri", cri);
      model.addAttribute("search", sch);
   }
   
   @RequestMapping(value = "/board/modify", method = RequestMethod.POST)
   public String modify_post(Model model, BoardVO vo) throws Exception {
      logger.info("수정완료");
      System.out.println(vo.getTitle());
      service.update_post(vo);
      return "redirect:/";
   }
   
   @RequestMapping(value = "/board/delete", method = RequestMethod.POST)
   public String delete(Model model, BoardVO vo) throws Exception {
      logger.info("삭제완료");
      service.delete_post(vo.getBno());
      return "redirect:/";      
   }
   
   @RequestMapping(value = "/board/write", method = RequestMethod.GET)
   public void write(Model model, Criteria cri, Search sch) throws Exception {
      logger.info("글쓰기 페이지");
      model.addAttribute("cri", cri);
      model.addAttribute("search", sch);
   }
   
   @RequestMapping(value = "/board/write", method = RequestMethod.POST)
   public String write_post(BoardVO vo) throws Exception {
      logger.info("쓰기완료");
      service.write_post(vo);
      return "redirect:/";      
   }   
}
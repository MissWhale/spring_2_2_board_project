package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.CommentVO;
import com.inhatc.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> commentSearch(int bno) {
		return dao.commentSearch(bno);
	}

	@Override
	public int commentUpdate(int com_no, String com_cont,String com_code) {
		return dao.commentUpdate(com_no, com_cont,com_code);
	}

	@Override
	public int commentDelete(int com_no) {
		return dao.commentDelete(com_no);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return dao.commentInsert(vo);
	}
	

}
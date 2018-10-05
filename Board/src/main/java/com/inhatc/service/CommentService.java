package com.inhatc.service;

import java.util.List;
import com.inhatc.domain.CommentVO;

public interface CommentService {
	public List<CommentVO> commentSearch(int bno);
	public int commentUpdate(int com_no, String com_cont,String com_code);
	public int commentDelete(int com_no);
	public int commentInsert(CommentVO vo);
}
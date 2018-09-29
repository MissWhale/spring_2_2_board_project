package com.inhatc.persistence;

import java.util.List;
import com.inhatc.domain.CommentVO;

public interface CommentDAO {
	public List<CommentVO> commentSearch(int bno);
	public int commentUpdate(int com_no, String com_cont);
	public int commentDelete(int com_no);
	public int commentInsert(CommentVO vo);
}
package com.inhatc.service;

import java.util.List;

import com.inhatc.domain.BoardVO;
import com.inhatc.domain.Criteria;
import com.inhatc.domain.Search;

public interface BoardService {
	public List<BoardVO> listAll() throws Exception;
	public BoardVO read(int bno) throws Exception;
	public int add_hits(int bno) throws Exception;
	public int update_post(BoardVO vo) throws Exception;
	public int delete_post(int bno) throws Exception;
	public int write_post(BoardVO vo) throws Exception;
	public int getCount() throws Exception;
	public List<BoardVO> selectPage(Criteria cri) throws Exception;
	public List<BoardVO> search(Search sch, Criteria cri) throws Exception;
	public int searchBoardCount(Search sch) throws Exception;
}
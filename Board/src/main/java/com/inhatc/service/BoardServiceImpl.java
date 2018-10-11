package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.BoardVO;
import com.inhatc.domain.Criteria;
import com.inhatc.domain.Search;
import com.inhatc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	public List<BoardVO> getLang() throws Exception {
		// TODO Auto-generated method stub
		return dao.getLang();
	}
	public List<BoardVO> langSearch(String language) throws Exception {
		// TODO Auto-generated method stub
		return dao.langSearch(language);
	}
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	@Override
	public int add_hits(int bno) throws Exception {
		return dao.add_hits(bno);
	}
	@Override
	public int update_post(BoardVO vo) throws Exception {
		return dao.update_post(vo);
	}
	@Override
	public int delete_post(int bno) throws Exception {
		return dao.delete_post(bno);
	}
	@Override
	public int write_post(BoardVO vo) throws Exception {
		return dao.write_post(vo);
	}
	@Override
	public int getCount() throws Exception {
		return dao.getCount();
	}
	@Override
	public List<BoardVO> selectPage(Criteria cri) throws Exception {
		return dao.selectPage(cri);
	}
	@Override
	public List<BoardVO> search(Search sch, Criteria cri) throws Exception {
		return dao.search(sch, cri);
	}
	@Override
	public int searchBoardCount(Search sch) throws Exception {
		return dao.searchBoardCount(sch);
	}

}
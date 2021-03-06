package com.inhatc.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.BoardVO;
import com.inhatc.domain.Criteria;
import com.inhatc.domain.Search;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.js.mapper.BoardMapper";

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(namespace+".allSelect");
	}
	public List<BoardVO> getLang() throws Exception {
		return session.selectList(namespace+".getLang");
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return session.selectOne(namespace+".read", bno);
	}

	@Override
	public int add_hits(int bno) throws Exception {
		return session.update(namespace+".add_hits", bno);
	}

	@Override
	public int update_post(BoardVO vo) throws Exception {
		return session.update(namespace+".update_post", vo);
	}

	@Override
	public int delete_post(int bno) throws Exception {
		return session.delete(namespace+".delete_post", bno);
	}

	@Override
	public int write_post(BoardVO vo) throws Exception {
		return session.insert(namespace+".write_post", vo);
	}

	@Override
	public int getCount() throws Exception {
		return session.selectOne(namespace+".getCount");
	}

	@Override
	public List<BoardVO> selectPage(Criteria cri) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(cri.getNumberOfRecords() != 0)
		{
			paramMap.put("start", (cri.getCurrentPageNo() - 1) * cri.getMaxPost());
			paramMap.put("end", cri.getMaxPost());
		}
		else
		{
			paramMap.put("start", 0);
			paramMap.put("end", cri.getMaxPost());			
		}
		//System.out.println(paramMap.get("start") + " " + paramMap.get("end"));
		return session.selectList(namespace+".selectPage", paramMap);
	}

	@Override
	public List<BoardVO> search(Search sch, Criteria cri) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(cri.getNumberOfRecords() != 0)
		{
			paramMap.put("start", (cri.getCurrentPageNo() - 1) * cri.getMaxPost());
			paramMap.put("end", cri.getMaxPost());
		}
		else
		{
			paramMap.put("start", 0);
			paramMap.put("end", cri.getMaxPost());			
		}
		paramMap.put("searchType", sch.getSearchType());
		paramMap.put("search", sch.getSearch());
		paramMap.put("language", sch.getLanguage());
		System.out.println("searchtype"+sch.getSearchType());
		System.out.println("search"+sch.getSearch());
		System.out.println("language"+sch.getLanguage());
		return session.selectList(namespace+".search_board", paramMap);
	}

	@Override
	public int searchBoardCount(Search sch) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		System.out.println(sch.getSearchType());
		System.out.println(sch.getSearch());
		System.out.println(sch.getLanguage());
		paramMap.put("searchType", sch.getSearchType());
		paramMap.put("search", sch.getSearch());
		paramMap.put("language", "JavaScript");
		System.out.println(paramMap.get("language"));
		return session.selectOne(namespace+".search_board_count", paramMap);
	}
}
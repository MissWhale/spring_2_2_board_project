package com.inhatc.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.CommentVO;


@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.js.mapper.CommentMapper";

	@Override
	public List<CommentVO> commentSearch(int bno) {
		return session.selectList(namespace+".commentSearch", bno);
	}

	@Override
	public int commentUpdate(int com_no, String com_cont,String com_code) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("com_no", com_no);
		paramMap.put("com_cont", com_cont);
		paramMap.put("com_code", com_code);
		System.out.println("다오임플"+com_code);
		return session.update(namespace+".commentUpdate", paramMap);
	}

	@Override
	public int commentDelete(int com_no) {
		return session.delete(namespace+".commentDelete", com_no);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return session.insert(namespace+".commentInsert", vo);
	}


}
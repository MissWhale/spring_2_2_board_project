package com.inhatc.persistence;

import java.util.HashMap;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.inhatc.domain.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	@Inject
	private SqlSession session;
	@Inject
	private static String namespace = "com.js.mapper.registerMapper";

	@Override
	public int register(RegisterVO vo){
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		paramMap.put("pw", vo.getPw());
		paramMap.put("email", vo.getEmail());
		paramMap.put("name", vo.getName());
		int result = session.insert(namespace+".register",paramMap);
		return result;
//		return 0;
	}
	@Override
	public int getid(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		int result=session.selectOne(namespace+".idck", vo);
		return result;
	}
	@Override
	public int getemail(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", vo.getEmail());
		int result=session.selectOne(namespace+".emailck", vo);
		return result;
	}
	public RegisterVO findid(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", vo.getName());
		paramMap.put("email", vo.getEmail());
		RegisterVO result=session.selectOne(namespace+".findid", vo);
		return result;
	}
	public RegisterVO findpw(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		paramMap.put("name", vo.getName());
		paramMap.put("email", vo.getEmail());
		RegisterVO result=session.selectOne(namespace+".findpw", vo);
		return result;
	}

}
package com.inhatc.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.js.mapper.LoginMapper";

	@Override
	public boolean login_check(String id, String pw) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("pw", pw);
		int result = session.selectOne(namespace+".login_check",paramMap);
		
		if(result == 1)
			return true;
		else
			return false;
	}

}
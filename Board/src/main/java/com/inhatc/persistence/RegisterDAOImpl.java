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
		// paramMap.put("id", id);
		// paramMap.put("pw", pw);
		// paramMap.put("email", email);
		// paramMap.put("name", name);
		// System.out.println("DAOimpl");
		// System.out.println("id : "+paramMap.get("id"));
		// System.out.println("pw : "+paramMap.get("pw"));
		// System.out.println("email : "+paramMap.get("email"));
		// System.out.println("name : "+paramMap.get("name"));
		// System.out.println(namespace+" "+paramMap);
		// System.out.println(session.insert(namespace+".registers",paramMap));
		// int result = session.selectOne(namespace+".login_check",paramMap);
		
		// if(result == 1)
		// 	return true;
		// else
		// 	return false;
		paramMap.put("id", vo.getId());
		paramMap.put("pw", vo.getPw());
		paramMap.put("email", vo.getEmail());
		paramMap.put("name", vo.getName());
		System.out.println("id : "+vo.getId());
		System.out.println("id : "+vo.getPw());
		System.out.println("id : "+vo.getEmail());
		System.out.println("id : "+vo.getName());
		int result = session.insert(namespace+".register",paramMap);
		return result;
//		return 0;
	}
	@Override
	public int getid(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		System.out.println("id : "+vo.getId());
		int result=session.selectOne(namespace+".idck", vo);
		System.out.println("DAOImpl결과 : "+result);
		return result;
	}
	@Override
	public int getemail(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", vo.getEmail());
		System.out.println("id : "+vo.getEmail());
		int result=session.selectOne(namespace+".emailck", vo);
		System.out.println("DAOImpl결과 : "+result);
		return result;
	}
	public RegisterVO findid(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", vo.getName());
		paramMap.put("email", vo.getEmail());
		System.out.println("DAOImpl name : "+vo.getName()+" email : "+vo.getEmail());
		RegisterVO result=session.selectOne(namespace+".findid", vo);
		return result;
	}
	public RegisterVO findpw(RegisterVO vo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		paramMap.put("name", vo.getName());
		paramMap.put("email", vo.getEmail());
		System.out.println("DAOImpl name : "+vo.getName()+" email : "+vo.getEmail()+" id :"+vo.getId());
		RegisterVO result=session.selectOne(namespace+".findpw", vo);
		return result;
	}

}
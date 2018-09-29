package com.inhatc.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.inhatc.domain.RegisterVO;
import com.inhatc.persistence.RegisterDAO;
import com.inhatc.service.RegisterService;
@Service
public class RegisterServiceImpl implements RegisterService {

	@Inject
	private RegisterDAO dao;
	
	@Override
	public int register(RegisterVO vo){
		// TODO Auto-generated method stub
		System.out.println(vo+"Test");
		return dao.register(vo);
	}
	public int getid(RegisterVO vo){
		return dao.getid(vo);
	}
	public int getemail(RegisterVO vo){
		return dao.getemail(vo);
	}
	public RegisterVO findid(RegisterVO vo){
		return dao.findid(vo);
	}
	public RegisterVO findpw(RegisterVO vo){
		return dao.findpw(vo);
	}
}
package com.inhatc.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override
	public boolean login_check(String id, String pw) {
		// TODO Auto-generated method stub
		return dao.login_check(id, pw);
	}

}
package com.inhatc.persistence;

import com.inhatc.domain.RegisterVO;
public interface RegisterDAO {
	//public boolean login_check(String id, String pw);
	public int register(RegisterVO vo);
	public int getid(RegisterVO vo);
	public int getemail(RegisterVO vo);
	public RegisterVO findid(RegisterVO vo);
	public RegisterVO findpw(RegisterVO vo);
}
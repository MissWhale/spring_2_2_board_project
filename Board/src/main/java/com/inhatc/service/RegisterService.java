package com.inhatc.service;
import com.inhatc.domain.RegisterVO;
public interface RegisterService {
	public int register(RegisterVO vo);
	public int getid(RegisterVO vo);
	public int getemail(RegisterVO vo);
	public RegisterVO findid(RegisterVO vo);
	public RegisterVO findpw(RegisterVO vo);
}
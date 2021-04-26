package com.study.tw.service;

import com.study.tw.vo.MemberVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;

	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO modify(String userId) throws Exception;
	
	public void modifyDo(MemberVO vo) throws Exception;
	
	public void delete(MemberVO vo) throws Exception;
}

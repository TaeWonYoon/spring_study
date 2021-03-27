package com.study.tw.dao;

import com.study.tw.vo.MemberVO;

public interface MemberDAO {
	
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
}

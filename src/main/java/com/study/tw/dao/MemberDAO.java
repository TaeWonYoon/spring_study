package com.study.tw.dao;

import java.util.List;

import com.study.tw.vo.MemberVO;

public interface MemberDAO {
	
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO modify(String userId) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(MemberVO vo) throws Exception;
	
	//admin페이지
	public List<MemberVO> adminList() throws Exception;
	
	public void adminModify(MemberVO vo) throws Exception;
}

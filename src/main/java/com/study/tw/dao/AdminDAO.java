package com.study.tw.dao;

import java.util.List;

import com.study.tw.vo.MemberVO;

public interface AdminDAO {
	
	public List<MemberVO> listAll() throws Exception;
}

package com.study.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.study.tw.vo.MemberVO;

public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "AdminMapper";
	
	@Override
	public List<MemberVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}
}

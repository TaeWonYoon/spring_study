package com.study.tw.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.tw.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "UserMapper";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		session.insert(namespace+".register", vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return session.selectOne(namespace+".login", vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = session.selectOne(namespace+".idChk", vo);
		return result;
	}
	
	@Override
	public MemberVO modify(String userId) throws Exception {
		return session.selectOne(namespace+".modify", userId);
	}
	
	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}
	
	@Override
	public void delete(MemberVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}
}

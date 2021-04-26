package com.study.tw.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.tw.dao.MemberDAO;
import com.study.tw.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
			dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	
	@Override
	public MemberVO modify(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.modify(userId);
	}
	
	@Override
	public void modifyDo(MemberVO vo) throws Exception {
		 dao.update(vo);
	}
	
	@Override
	public void delete(MemberVO vo) throws Exception {
		dao.delete(vo);
	}
}

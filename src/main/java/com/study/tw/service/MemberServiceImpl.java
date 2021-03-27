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
}

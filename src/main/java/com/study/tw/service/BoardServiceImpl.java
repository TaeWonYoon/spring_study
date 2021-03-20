package com.study.tw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.tw.dao.BoardDAO;
import com.study.tw.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	  private BoardDAO dao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
}

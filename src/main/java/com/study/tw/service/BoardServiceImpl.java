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
	
	@Override
	public BoardVO read(Integer bno) throws Exception {
			   //dao.boardHit(bno);
		return dao.read(bno);
	}
	
	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}
}

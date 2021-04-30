package com.study.tw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.study.tw.dao.BoardDAO;
import com.study.tw.vo.BoardVO;
import com.study.tw.vo.CommentVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	  private BoardDAO dao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Override
	public List<BoardVO> listAll(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(displayPost, postNum);
	}
	

	@Override
	public List<BoardVO> listAllSearch(int displayPost, int postNum,String content, String condition) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAllSearch(displayPost, postNum, content, condition);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer bno) throws Exception {
			   dao.boardHit(bno);
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
	
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}
	
	@Override
	public void commentCreate(CommentVO vo) throws Exception {
		dao.commetCreate(vo);
	}
	
	@Override
	public List<CommentVO> commentList(int readBno) throws Exception {
		// TODO Auto-generated method stub
		return dao.commentList(readBno);
	}
	
	@Override
	public void commentDelete(int commentBno) throws Exception {
		// TODO Auto-generated method stub
		dao.commentDelete(commentBno);
	}
}

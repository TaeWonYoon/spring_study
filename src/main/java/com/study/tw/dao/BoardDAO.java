package com.study.tw.dao;

import java.util.List;

import com.study.tw.vo.BoardVO;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public List<BoardVO> listAll(int displayPost, int postNum) throws Exception;
	
	public List<BoardVO> listAllSearch(int displayPost, int postNum, String content, String condition) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public void boardHit(int bno) throws Exception;

	public int count() throws Exception;

}

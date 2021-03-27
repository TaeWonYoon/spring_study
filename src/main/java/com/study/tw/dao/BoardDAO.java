package com.study.tw.dao;

import java.util.List;

import com.study.tw.vo.BoardVO;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
}

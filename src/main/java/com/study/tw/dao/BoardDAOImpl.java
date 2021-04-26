package com.study.tw.dao;


import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.tw.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public BoardVO read(int bno) throws Exception {
		return session.selectOne(namespace+".read", bno);
	}
	
	
	@Override
	public List<BoardVO> listAllSearch(int displayPost, int postNum, String content,String condition) throws Exception {
		HashMap data = new HashMap();
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		 if(condition.equals("title")) {
			 data.put("title", content);
		 } else if (condition.equals("user_id")) {
			 data.put("user_id", content);
		 } else if (condition.equals("search_t") && (!content.equals("ass"))) {
			 data.put("search_t", content);
		 } else if (content.equals("ass")) {
			 data.put("contents", content);
		 } 
		return session.selectList(namespace+".listAllSearch", data);
	}
	
	@Override
	public List<BoardVO> listAll(int displayPost, int postNum) throws Exception {
		HashMap data = new HashMap();
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		return session.selectList(namespace+".listAll", data);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", bno);
	}
	
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".updateViewCnt", bno);
	}
	
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".count");
	}
}

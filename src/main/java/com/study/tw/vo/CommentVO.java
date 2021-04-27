package com.study.tw.vo;

import java.util.Date;

public class CommentVO {

	private int commentBno;
	private int readBno;
	private String writer;
	private String user_id;
	private String comment;
	private Date regdate;
	
	public CommentVO() {
	}

	public int getCommentBno() {
		return commentBno;
	}

	public void setCommentBno(int commentBno) {
		this.commentBno = commentBno;
	}

	public int getReadBno() {
		return readBno;
	}

	public void setReadBno(int readBno) {
		this.readBno = readBno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}

package com.hw.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1041155315714384727L;
	
	
	private int bno;			// 게시글 번호
	private int btype;			// 게시판 종류
	private String btitle;		// 제목
	private String bcontent;	// 게시글 내용
	private String bwriter;		// 게시글 작성자
	private String bwriterId;	// DB로부터 가져올 게시글 작성자 아이디
	private int bcount;			// 게시글 조회수
	private String boardfile;	// 게시글 첨부파일--Attachment File
	private Date bdate;			// 작성일
	private String status;		// 삭제여부('Y'이면 삭제 X, 'N'이면 삭제 O)
	
	
	
	private int bpwd;//게시글 비번 4자리
	
	
	public int getBpwd() {
		return bpwd;
	}

	public void setBpwd(int bpwd) {
		this.bpwd = bpwd;
	}



	//게시글 등록시 필요한 요소
	public Board(String btitle, String bcontent, String bwriter, int bpwd) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bpwd = bpwd;
	}
	
	
	
	
	
	
	
	
	
	
	public Board() {}

	public Board(String btitle, String bcontent, String bwriter, String boardfile) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.boardfile = boardfile;
	}

	public Board(int bno, int btype, String btitle, String bcontent, String bwriter, int bcount, String boardfile,
			Date bdate, String status) {
		super();
		this.bno = bno;
		this.btype = btype;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.boardfile = boardfile;
		this.bdate = bdate;
		this.status = status;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBwriterId() {
		return bwriterId;
	}

	public void setBwriterId(String bwriterId) {
		this.bwriterId = bwriterId;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBoardfile() {
		return boardfile;
	}

	public void setBoardfile(String boardfile) {
		this.boardfile = boardfile;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btype=" + btype + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter="
				+ bwriter + ", bwriterId=" + bwriterId + ", bcount=" + bcount + ", boardfile=" + boardfile + ", bdate="
				+ bdate + ", status=" + status + "]";
	}
	
	
	
}













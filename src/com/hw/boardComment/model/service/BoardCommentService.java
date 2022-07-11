package com.hw.boardComment.model.service;

import static com.hw.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.boardComment.model.dao.BoardCommentDao;
import com.hw.boardComment.model.vo.BoardComment;

public class BoardCommentService {

	private BoardCommentDao bcDao = new BoardCommentDao();
	
	
	public ArrayList<BoardComment> selectList(int bno) {
		Connection con = getConnection();
		
		ArrayList<BoardComment> clist = bcDao.selectList(con,bno);
		close(con);
		return clist;
	}
	

	public int insertComment(BoardComment bco) {
		Connection con = getConnection();
		
		int result = bcDao.insertComment(con, bco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	

	public int deleteComment(int bno, int cno) {
		
		Connection con = getConnection();
		
		int result = bcDao.deleteComment(con, bno, cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;		
	}
	
}

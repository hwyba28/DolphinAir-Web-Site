package com.hw.board.model.service;

import static com.hw.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.board.model.dao.BoardDao;
import com.hw.board.model.vo.Board;

public class BoardService {

	private BoardDao bDao = new BoardDao();
	
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = bDao.getListCount(con);
		
		close(con);
		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = bDao.selectList(con,currentPage,limit);
		
		close(con);
		return list;
	}

	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = bDao.insertBoard(con,b);
		
		// insert이니깐
		// 성공여부에 따라서 commit또는 rollback하자
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	public Board selectOne(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con,bno);
		if(b != null) {
			int result = bDao.updateReadCount(con,bno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		close(con);
		return b;
	}
	
	
	public Board selectOne2(String title) {
		Connection con = getConnection();
		Board result = bDao.selectOne2(con,title);

		if(result != null) {
			
			if(result!=null) commit(con);
			else rollback(con);
		}
		close(con);
		return result;
	}
	
	

	public ArrayList<Board> selectTop5() {
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.selectTop5(con);
		
		close(con);
		
		return list;
	}

	public int updateBoard(Board b) {
		Connection con = getConnection();
		
		int result = bDao.updateBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public Board updateView(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con, bno);
		
		close(con);
		
		return b;
	}

	public int deleteBoard(int bno) {
		Connection con = getConnection();
		int result = bDao.deleteBoard(con,bno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	
	
	
	/*
	//search
	public ArrayList<Board> searchBoard(String category, String keyword) {
		Connection con = getConnection();
		ArrayList<Board> list = null;

		list = (category.length() >0) ? 
				bDao.searchBoard(con,category,keyword):  bDao.selectList2(con);//임시
		
		return list;
	}
*/
	public ArrayList<Board> searchBoard(String category, String keyword, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = null;

		list = (keyword.length() >0) ? 
				bDao.searchBoard(con,category,keyword):  bDao.selectList(con,currentPage,limit);//임시
		
		return list;
	}
	}
	
	


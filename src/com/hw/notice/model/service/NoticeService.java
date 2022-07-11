package com.hw.notice.model.service;

import static com.hw.common.JDBCTemplate.close;
import static com.hw.common.JDBCTemplate.commit;
import static com.hw.common.JDBCTemplate.getConnection;
import static com.hw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.notice.model.dao.NoticeDao;
import com.hw.notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();
	
	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> list = nDao.selectList(con);
		
		close(con);
		
		return list;
	}

	public Notice selectOne(int nno) {
		
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		// 게시글의 상세보기를 통해 1회 조회할때
		//1. nno에 해당하는 게시글 내용을 가져오기(SELECT)
		//2. 게시글 내용이 성공적으로 불러와졌다면 (UPDATE) 조회수가 1 증가해야한다.
		if(n != null) {
			int result = nDao.updateReadCount(con,nno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		return n;
	}

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = nDao.insertNotice(con,n);
		
		if(result >= 1) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	public Notice updateView(int nno) {
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con, nno);
		
		close(con);
		return n;
	}

	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = nDao.updateNotice(con,n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteNotice(int nno) {
		Connection con = getConnection();
		
		int result = nDao.deleteNotice(con,nno);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Notice> searchNotice(String category, String keyword) {
		
		Connection con = getConnection();
		ArrayList<Notice> list = null;
		
//		if(category.length() >0) {
//			list = nDao.searchNotice(con,category,keyword);
//		}else {
//			list = nDao.selectList(con);
//		}
		
		list = (category.length() >0) ? 
				nDao.searchNotice(con,category,keyword):  nDao.selectList(con);
		
		return list;
	}

}







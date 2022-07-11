package com.hw.notice.model.dao;

import static com.hw.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.hw.notice.model.vo.Notice;
public class NoticeDao {

	private Properties prop;
	
	public NoticeDao() {
		prop = new Properties();
		
		String filePath = NoticeDao.class.getResource("/config/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectList(Connection con) {
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList"); // select * from notice
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();//DB속에서 시퀀스처리 완료 필수!!
				n.setNno(rset.getInt(1));
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
				n.setNwriter(rset.getString("nwriter"));
				n.setNcount(rset.getInt("ncount"));//DB 에서 생성된 자동으로 숫자 들어갈 항목(시퀀스)-조회수
				n.setNdate(rset.getDate("ndate"));
				
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		//System.out.println(list); 잘 들어감
		return list;
	}
	
	
//	public ArrayList<Notice> selectList(Connection conn) {
//		
//		ArrayList<Notice> list = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		try {
//			
//			String sql ="SELECT*FROM NOTICE";
//			pstmt = conn.prepareStatement(sql);
//			
//			
//			rset = pstmt.executeQuery();
//			list = new ArrayList<Notice>();
//			if(rset.next()) {
//				Notice n =new Notice();
//				
//				n.setNno(rset.getInt("NNO"));
//				n.setNtitle(rset.getString("ntitle"));
//				n.setNcontent(rset.getString("ncontent"));
//				n.setNwriter(rset.getString("nwriter"));
//				n.setNcount(rset.getInt("ncount"));
//				n.setNdate(rset.getDate("ndate"));
//				list.add(n);
//			}
//			
//		} catch (Exception e) {
//			 e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return list;
//	}
//	
	/*
	public ArrayList<Notice> selectList(Connection con) {
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		//String sql = prop.getProperty("selectList"); // select * from notice
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery("SELECT*FROM NOTICE");
			System.out.println(rset);

			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
			System.out.println(rset.getInt(1));
				n.setNno(rset.getInt(1));
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
				n.setNwriter(rset.getString("nwriter"));
				n.setNcount(rset.getInt("ncount"));
				n.setNdate(rset.getDate("ndate"));
				
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		//System.out.println(list);
		return list;
	}
*/
	public Notice selectOne(Connection con, int nno) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			// INSERT,UPDATE,DELETE : executeUpdate()
			// SELECT : executeQuery()
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNno(nno);
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
				n.setNwriter(rset.getString("nwriter"));
				n.setNcount(rset.getInt("ncount"));
				n.setNdate(rset.getDate("ndate"));
			}
			
			System.out.println("notice 확인 : " + n);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int updateReadCount(Connection con, int nno) {
//게시글 조회수 증가		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadCount");//+1
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
			// INSERT,UPDATE,DELTE : executeUpdate()
			// SELECT : executeQuery()
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNotice(Connection con, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			// 미완성된 SQL을 준비
			pstmt = con.prepareStatement(sql);
			// SQL의 ?를 채워서 쿼리 완성
			pstmt.setString(1, n.getNtitle());
			pstmt.setString(2,n.getNcontent());
			pstmt.setString(3, n.getNwriter());
			pstmt.setDate(4, n.getNdate());
			// 결과 확인
			result = pstmt.executeUpdate();
			// INSERT,UPDATE,DELTE : executeUpdate()
			// SELECT : executeQuery()
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection con, Notice n) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt =  con.prepareStatement(sql);
			pstmt.setString(1, n.getNtitle());
			pstmt.setString(2, n.getNcontent());
			pstmt.setInt(3, n.getNno());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection con, int nno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> searchNotice(Connection con, String category, String keyword) {
		ArrayList<Notice> list =null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		
		String sql = null;
		
		
		
		System.out.println("[NoticeDao] 카테고리: "+category+" / 키워드: "+keyword);

		
		
		
		switch(category) {
		case "title":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM NOTICE WHERE NTITLE LIKE '"+keyword+"'";
			break;
		case "content":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM NOTICE WHERE NCONTENT LIKE '"+keyword+"'";
			break;
		case "title content":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM NOTICE WHERE (NTITLE LIKE '"+keyword+"' OR NCONTENT LIKE '"+keyword+"')";
			//내용+제목 검색
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setNno(rset.getInt("nno"));
				n.setNtitle(rset.getString("ntitle"));
				n.setNcontent(rset.getString("ncontent"));
				n.setNwriter(rset.getString("nwriter"));
				n.setNcount(rset.getInt("ncount"));
				n.setNdate(rset.getDate("ndate"));
				
				list.add(n);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}















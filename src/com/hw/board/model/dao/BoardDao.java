package com.hw.board.model.dao;

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

import com.hw.board.model.vo.Board;
public class BoardDao {

	private Properties prop;
	
	public BoardDao() {
		prop = new Properties();
		
		String filePath = BoardDao.class.getResource("/config/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	public int getListCount(Connection con) {
		// 총 게시글 수
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	
	
	
	
	
	
	
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Board> list =null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		//DB에서 시퀀스로 순서대로 올라가는 INDEX 안 만들어주면 에러!!!
		
		//CREATE UNIQUE INDEX "JSP"."SYS_C007586" ON "JSP"."BOARD" ("BNO") ;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit +1; // 1, 11
			int endRow = startRow + limit - 1; // 10,20
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setBtype(rset.getInt("BTYPE"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setBwriter(rset.getString("BWRITER"));
				b.setBcount(rset.getInt("BCOUNT"));
				b.setBdate(rset.getDate("BDATE"));
			
				list.add(b);
			}
			
		}catch(SQLException e) {
			
		}finally {
			close(rset);
			close(pstmt);
		}
	//	System.out.println(list);

		return list;
	}

	public int insertBoard(Connection con, Board b) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getBcontent());
			pstmt.setString(3, b.getBwriter());
			pstmt.setInt(4, b.getBpwd());
			pstmt.setString(5, b.getBwriterId());//잘들어감 file 대신에!
		
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public Board selectOne(Connection con, int bno) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setBtype(rset.getInt("BTYPE"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setBwriter(rset.getString("BWRITER"));
				b.setBpwd(rset.getInt("BPWD"));
				b.setBcount(rset.getInt("BCOUNT"));
				b.setBdate(rset.getDate("BDATE"));
			//	System.out.println(b.getBwriter());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public int updateBoard(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = null;
	
			sql = prop.getProperty("updateBoard");
					
	//타이틀 콘텐츠 이메일
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getBcontent());
			pstmt.setString(3, b.getBwriterId());
			pstmt.setInt(4, b.getBno());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}
	
	
	
	public int updateReadCount(Connection con, int bno) {
		//게시글 조회수 증가		
				int result = 0;
				
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("updateReadCount");//+1
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
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

	
	
	public ArrayList<Board> selectTop5(Connection con) {
		ArrayList<Board> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectTop5");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				
				Board b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setBtype(rset.getInt("BTYPE"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setBwriter(rset.getString("BWRITER"));
				b.setBcount(rset.getInt("BCOUNT"));
				b.setBdate(rset.getDate("BDATE"));
				b.setBoardfile(rset.getString("BOARDFILE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}


/////-------------------------------------------------------------------------------

	public ArrayList<Board> searchBoard(Connection con, String category, String keyword) {

		ArrayList<Board> list =null;
		PreparedStatement pstmt=null;
		ResultSet rset = null;
System.out.println("[BoardDao] 카테고리: "+category+" / 키워드: "+keyword);
		String sql = null;
		switch(category) {//properties 편집
		case "title":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM BOARD WHERE BTITLE LIKE '"+keyword+"'";
			break;
		case "content":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM BOARD WHERE BCONTENT LIKE '"+keyword+"'";
			break;
		case "title content":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM BOARD WHERE (BTITLE LIKE '"+keyword+"' OR BCONTENT LIKE '"+keyword+"')";
			break;
		case "writer":
			keyword = "%"+keyword+"%";
			sql = "SELECT * FROM BOARD WHERE BWRITER LIKE '"+keyword+"'";
			break;	
		}
	//CONCAT??
		//System.out.println(sql);
		
		//-------------------------------------------------
		try {
			
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, keyword);//카테고리 분류 된 상태에서 검색어만 들어가게
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBcount(rset.getInt("bcount"));
				b.setBdate(rset.getDate("bdate"));
				
				list.add(b);
				System.out.println(b);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Board> selectList2(Connection con) {
		ArrayList<Board> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList"); // select * from board
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBno(rset.getInt(1));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBcount(rset.getInt("bcount"));
				b.setBdate(rset.getDate("bdate"));
				
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		System.out.println(list);
		return list;
	}






	public Board selectOne2(Connection con, String title) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	//	String sql = prop.getProperty("selectOne2");
		String sql = "SELECT * FROM BOARD WHERE BTITLE=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			
			rset = pstmt.executeQuery();

			b = new Board();

			if(rset.next()) {
				
				b.setBno(rset.getInt("BNO"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setBwriter(rset.getString("BWRITER"));
				b.setBwriterId(rset.getString("BOARDFILE"));

			//	System.out.println("여기는 DAO = "+b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	
	
	

	
	
	
	


}















































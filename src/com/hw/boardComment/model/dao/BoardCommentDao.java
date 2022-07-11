package com.hw.boardComment.model.dao;

import static com.hw.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hw.boardComment.model.vo.BoardComment;
import com.hw.member.model.exception.MemberException;

public class BoardCommentDao {
	
	private Properties prop = new Properties();
	
	public BoardCommentDao() {
		String filePath = BoardCommentDao.class
				.getResource("/config/comment-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//댓글 보기
	public ArrayList<BoardComment> selectList(Connection con, int bno) {
		ArrayList<BoardComment> clist = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<BoardComment>();
			
			while(rset.next()) {
				BoardComment bco = new BoardComment();
				bco.setCno(rset.getInt("CNO"));
				bco.setBno(bno);
				bco.setCcontent(rset.getString("CCONTENT"));
				bco.setCwriter(rset.getString("USERNAME"));
				bco.setCwriterId(rset.getString("CWRITER"));
				bco.setCdate(rset.getDate("CDATE"));
				bco.setRefcno(rset.getInt("REF_CNO"));
				bco.setClevel(rset.getInt("CLEVEL"));
				clist.add(bco);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return clist;
	}

	//댓글 추가
	public int insertComment(Connection con, BoardComment bco) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bco.getBno());
			pstmt.setString(2,  bco.getCcontent());
			pstmt.setString(3,  bco.getCwriter());
			
			if( bco.getRefcno() > 0) {
				
				pstmt.setInt(4,  bco.getRefcno());
				
			} else {
				
				pstmt.setNull(4, java.sql.Types.NULL);
				
			}
			
			pstmt.setInt(5,  bco.getClevel());
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			close(pstmt);			
		}
		
		return result;
	}

	
	
	//댓글 삭제
	public int deleteComment(Connection con, int bno, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM BOARD_COMMENT WHERE BNO= ? AND CNO=? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, cno);

			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}















package com.hw.member.model.dao;

import static com.hw.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.hw.member.model.exception.MemberException;
import com.hw.member.model.vo.Member;


public class MemberDao {

	private Properties prop;
	
	public MemberDao() {
		prop = new Properties();
		
		String filePath
		   = MemberDao.class
		   .getResource("/config/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//1. 회원조회(로그인/회원정보)
	public Member selectMember(Connection conn, Member m) {
	
		Member result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		try {
			//String sql = prop.getProperty("selectMember");
			String sql ="SELECT * FROM MEMBER WHERE USERID=? AND PASSWORD=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				result.setUserId(m.getUserId());//현재 받아온 정보 기준으로 로그인하고
				result.setUserPwd(m.getUserPwd());
					
				result.setTitle(rset.getString(3));//그에 따른 회원과 맞는 데이터들 데려오기
				result.setUserName(rset.getString(4));
				result.setC_code(rset.getString("c_code"));
				result.setPhone(rset.getString("phone"));
				result.setAddress(rset.getString("address"));
				
			}
			
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	//2. 회원가입
public int insertMember(Connection conn, Member m) {
		
		// 처리된 결과의 결과를 받아줄 변수 선언(처리된 행의 갯수)
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		//context.xml / properties / db-연결정보 확인-
		String sql = "INSERT INTO DOLPHIN.MEMBER VALUES(?,?,NULL,NULL,NULL,NULL,NULL,DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
	
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/*
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		//String sql = "INSERT INTO MEMBER VALUES(?,?,SYSDATE)";
		String sql = "INSERT INTO MEMBER VALUES(?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 홀더부분 완성시키기
			// pstmt.setXXX(홀더 순번,값)
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
//			pstmt.setString(3, m.getUserName());
//			pstmt.setString(4, m.getGender());
//			pstmt.setInt(5, m.getAge());
//			pstmt.setString(6, m.getEmail());
//			pstmt.setString(7, m.getPhone());
//			pstmt.setString(8, m.getAddress());
//			pstmt.setString(9, m.getHobby());
//			
			result = pstmt.executeUpdate();
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
*/
	/*
	public int insertMember(Connection conn, Member m) throws MemberException {
		//결과 확인을 위한 변수 result 생성
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("insertMember");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());//?첫번째
			pstmt.setString(2, m.getUserPwd());
			
//			pstmt.setString(3, m.getTitle());
//			pstmt.setString(4, m.getUserName());
//			pstmt.setString(5, m.getPhone());
//			pstmt.setString(6, m.getAddress());
			

			result = pstmt.executeUpdate();//--에러1 - 종결

		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally{
			close(pstmt);
		}
		return result;
	}

	*/
	
	//3. 회원 정보 수정
public int updateMember(Connection conn, Member m) throws MemberException {
	int result = 0;
	PreparedStatement pstmt = null;
	
	try {
		
		String sql = "UPDATE DOLPHIN.MEMBER SET PASSWORD=?, TITLE=?, USERNAME=?, C_CODE=?, PHONE=?, ADDRESS=? WHERE USERID= ?";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, m.getUserPwd());
		pstmt.setString(2, m.getTitle());
		pstmt.setString(3, m.getUserName());
		pstmt.setString(4, m.getC_code());
		pstmt.setString(5, m.getPhone());
		pstmt.setString(6, m.getAddress());
		pstmt.setString(7, m.getUserId());
		
		result = pstmt.executeUpdate();
		
	}catch(SQLException e) {
		throw new MemberException(e.getMessage());
	}finally {
		close(pstmt);
	}
	
	return result;
}
	/* 
	 * 
	public int updateMember(Connection conn, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {

			String sql = "UPDATE DOLPHIN.MEMBER SET"
					+ " PASSWORD=?, TITLE=?, USERNAME=?, C_CODE=?, PHONE=?, ADDRESS=?"
					+ " WHERE USERID= " + m.getUserId();

		//	String sql = prop.getProperty("updateMember");
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getTitle());

			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getC_code());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());

			result = pstmt.executeUpdate();//최종 에러
			
		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
	}
*/
	//4. 회원 탈퇴
	public int deleteMember(Connection conn, String userId) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM MEMBER WHERE USERID= ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
//다시 중복확인 처리!---
	public int idDupCheck(Connection con, String id) {
		int result = -1;//이대로 계속 -1로 있다가 count로 0 반환되면 사용가능 아이디
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
				//result가 1개가 나오면 있는 아이디
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}














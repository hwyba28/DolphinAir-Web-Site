package com.hw.member.model.service;

import static com.hw.common.JDBCTemplate.*;

import java.sql.Connection;

import com.hw.member.model.dao.MemberDao;
import com.hw.member.model.exception.MemberException;
import com.hw.member.model.vo.Member;
// Service:
//   Controller인 서블릿에서
//   전달한 정보를 업무 수행로직(비즈니스 로직)에 따라
//   가공하여 Dao에게 전달하는 역할
public class MemberService {

	// Service는 하나의 SQL을 담당하는 DAO메소드들을 
	// 더 큰 하나의 서비스라는 개념으로 묶어 처리하는
	// 비즈니스 로직을 담당하는 객체이다.
	// 따라서 DB의 트랜잭션에 대한 TCL(commit/rollback)처리를 직접 담당해야한다.
	
	private Connection conn;
	private MemberDao mDao = new MemberDao();
	public Member selectMember(Member m) throws MemberException {
		
		conn = getConnection();
		
		Member result = mDao.selectMember(conn,m);
		
		close(conn);
		
		// 예외처리
		if(result == null) 
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		
		return result;
	}
	
	public int insertMember(Member m) throws MemberException {
		
		conn = getConnection();
		//System.out.println("에러1 위치 확인");
		int result = mDao.insertMember(conn, m);//에러1

		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int updateMember(Member m) throws MemberException {
		conn = getConnection();
		
		int result = mDao.updateMember(conn,m);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteMember(String userId) throws MemberException {
		conn = getConnection();
		
		int result = mDao.deleteMember(conn,userId);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	//중복확인위해 일반 조회!
	public int idDupCheck(String id) {
		Connection con = getConnection();
		int result = mDao.idDupCheck(con,id);
		close(con);
		return result; //-1은 시작전/0이면 사용가능 1(존재 아이디) 인지 여부에 따라
	}
}















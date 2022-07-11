package com.hw.reservation.model.service;

import static com.hw.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.member.model.exception.MemberException;
import com.hw.reservation.model.dao.ReserveDao;
import com.hw.reservation.model.vo.Reservation;

import com.hw.flight.model.vo.Flight;


public class ReserveService {

	
	private Connection conn;
	private ReserveDao rDao = new ReserveDao();
	
	
	//1. 전체 탑승객 예약 관리
	public int insertReserve(Reservation r) throws MemberException {
		
		conn = getConnection();
	
		int result = rDao.insertReserve(conn, r);
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
/*
	public int updateReserve(Reservation r) throws MemberException {
		conn = getConnection();
		
		int result = rDao.updateMember(conn,r);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
*/
	/*
	public int deleteReserve(String userId) throws MemberException {
		conn = getConnection();//jdbc template
		
		int result = rDao.deleteReserve(conn,userId);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
*/

		//회원용 예약 목록
		public int insertReserve2(Reservation r) throws MemberException {
			
			conn = getConnection();
		
			int result = rDao.insertReserve2(conn, r);
			if(result > 0) commit(conn);
			else rollback(conn);
			
			close(conn);
			return result;
		
	}

		
		public int insertReserve3(Reservation r) throws MemberException {
			
			conn = getConnection();
		
			int result = rDao.insertReserve3(conn, r);
			if(result > 0) commit(conn);
			else rollback(conn);
			
			close(conn);
			return result;
		
	}

		
		//회원 또는 비회원 예약 정보!
		public int insertTable(Reservation r) {
			
			conn = getConnection();
		
			int result = rDao.insertTable(conn, r);
			if(result > 0) commit(conn);
			else rollback(conn);
			
			close(conn);
			
			return result;
			
		}

		public int createTable(Reservation r) {
						
			conn = getConnection();
		
			int result = rDao.createTable(conn, r);
			if(result > 0) commit(conn);
			else rollback(conn);
			
			close(conn);
			
			return result;
			
		}


		
		//특정 항공권 한개객체 가져오면 됨
		public Flight selectFlight(Reservation r, String route_no) {
			Connection con = getConnection();
			
			Flight result = rDao.selectFlight(con, route_no);
			
			close(con);
			
			return result;			
		}

		
		
		//업데이트 insert 등 조회 제외, 모두 commit rollback 필수!
		public int updateOption(Reservation r) {
			
			Connection con = getConnection();
			
			int result = 0;
			try {
				result = rDao.updateOption(con,r);
			} catch (MemberException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		//중요?!	
			if(result > 0) commit(con);
			else rollback(con);
			
			
			close(con);
			return result;
		}
}















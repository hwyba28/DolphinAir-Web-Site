package com.hw.member.reserve.model.dao;

import static com.hw.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hw.reservation.model.vo.Reservation;

public class MemberReserveDao {

	//나의 예약(my reservation) 들어갈때 servlet으로 이동!!!
	//멤버의 예약정보를 리스트로 가져올 것!

	//그냥 일반 SELECT 구문 - 조회만 하면 됨!
	
	
	
	
	
	
	public ArrayList<Reservation> selectList(Connection con, String userId) {
		
		ArrayList<Reservation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
//		System.out.println("test2"+userId);
		
		//reserve 완료시 각 멤버/비멤버 당 테이블 생성 성공하면 아래 방법 사용!!

//		String new_id=userId.substring(0, userId.length()-6);
//		//1. 테이블 명 정하기!
//		new_id = new_id.replaceAll("@", "");
//		String mtable = "M"+new_id;//테이블 고유명!
		
		//비회원이면 NM_RESERVATION으로 들어가고
		//회원으로 일단 테스트중이므로 M_RESERVATION 접속
		
		String temp = userId + "/";
		
		//CREATE TABLE 필요있나? 그냥 일치하는 모든 목록 LIST로 뽑아오면 됨!
		//현재 RESERVATION TABLE/M_RESERVATION/NM_RESERVATION 있는데 우선 전체에서 조회해도 OK
		String sql = "SELECT * FROM DOLPHIN.RESERVATION WHERE EMAIL = ?";//USERID EMAIL로 예약시 바꾸어 놓음!
		
		try {
			//STMT는 CREATE하지만 PREPARED는 준비해놓은!
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, temp);
				
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Reservation>();//회원 예약 리스트
			
			while(rset.next()) {
				
				Reservation r = new Reservation();//DB속에서 시퀀스처리 완료 필수!!
				//예약 한건당
				
				r.setPMR_no(rset.getString("PMR_NO"));
				
				r.setRoute_no(rset.getString("ROUTE_NO"));
				r.setFrom(rset.getString("FROM"));
				r.setTo(rset.getString("To"));
				r.setDeparture(rset.getString("DEPARTURE"));
				r.setArrival2(rset.getString("ARRIVAL"));
				
				r.setEmail(userId);// USERID와 동일 / 가져는 와서 비교하되, 사용자 화면에 표기 할 필요 없음
				r.setTitle(rset.getString("TITLE"));
				r.setName(rset.getString("NAME"));
				r.setC_code(rset.getString("C_CODE"));
				r.setPhone(rset.getString("PHONE"));
				r.setAddress(rset.getString("ADDRESS"));

				r.setPclass(rset.getString("PCLASS"));
				r.setMeal(rset.getString("MEAL"));
				r.setSeat(rset.getString("SEAT"));
				r.setLuggage(rset.getString("LUGGAGE"));
				
				r.setOwner(rset.getString("OWNER"));
				r.setCard_no(rset.getString("CARD_NO"));
				r.setMm(rset.getString("MM"));
				r.setYy(rset.getString("YY"));
				r.setCvc(rset.getString("CVC"));
				
				r.setReserveDate(rset.getDate("RESERVEDATE"));
				
				list.add(r);
			//	System.out.println("test3"+r.toString2());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("test4"+list);
		return list;
	}




}

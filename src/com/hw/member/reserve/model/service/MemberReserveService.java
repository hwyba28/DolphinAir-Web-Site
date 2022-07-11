package com.hw.member.reserve.model.service;

import static com.hw.common.JDBCTemplate.close;
import static com.hw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.member.reserve.model.dao.MemberReserveDao;
import com.hw.reservation.model.vo.Reservation;

public class MemberReserveService {

private MemberReserveDao mrDao = new MemberReserveDao();
	
	public ArrayList<Reservation>selectList(String userId) {
		Connection con = getConnection();
		
		ArrayList<Reservation> list = mrDao.selectList(con, userId);
		
		close(con);
		
		return list;
	}
	

}

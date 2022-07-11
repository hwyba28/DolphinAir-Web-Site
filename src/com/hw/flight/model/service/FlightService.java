package com.hw.flight.model.service;

import static com.hw.common.JDBCTemplate.close;
import static com.hw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hw.flight.model.dao.FlightDao;
import com.hw.flight.model.vo.Flight;

public class FlightService {

	//항공권 목록 조회
	private FlightDao fDao = new FlightDao();
	
	public ArrayList<Flight> selectList(Flight f) {
		Connection con = getConnection();
		
		ArrayList<Flight> list = fDao.selectList(con,f);
		
		close(con);
		
		return list;
	}

	public Flight selectOne(String route_no) {
		Connection con = getConnection();
		
		Flight f = fDao.selectOne(con,route_no);
		
		close(con);
		
		return f;
	}
	
}

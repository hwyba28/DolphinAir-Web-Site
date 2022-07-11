package com.hw.flight.model.dao;

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

import com.hw.flight.model.vo.Flight;
public class FlightDao {

	//복사할 변수 = String.substring(start,end); //문자열  start위치 부터 end전까지 문자열 발췌
	
	
	private Properties prop;
	
	/*데이터 정보만 많이 넣고 input tag에서 date 받아온거 db로 sql만 잘 넣으면 완벽 구동됨 - 수정 예정*/

	public ArrayList<Flight> selectList(Connection con, Flight f1) {
		
		ArrayList<Flight> list = null;//결과 담을 리스트
		
		Statement stmt = null;
		ResultSet rset = null;
		//WHERE OrderDate NOT BETWEEN '2017-10-01' AND '2017-10-31'
//String sql = "";
//if(f1.getTo().equals("To Anywhere")) {
//	sql = "SELECT * FROM FLIGHTLIST"
//			+ " WHERE 'FROM' = '"+f1.getFrom()+"'AND 'TO'='"+f1.getTo()+"'";
//}else {
//			sql = "SELECT * FROM FLIGHTLIST"
//				+ " WHERE 'FROM' = '"+f1.getFrom()+"' AND TO='"+f1.getTo()
//				+ "' AND 'DEPARTURE' = to_date('"+f1.getDeparture()+"','RR/MM/DD'))";
//}
//	System.out.println(f1);	
		String sql = "SELECT * FROM FLIGHTLIST";
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);//SQL 조회 결과 저장
			
			list = new ArrayList<Flight>();//초기화(결과 받을 리스트)

			while(rset.next()) {
//				System.out.println(rset.getString("ROUTE_NO"));

				
				
				
				
				//여기서는 원래 넣은 값 +도착날짜/route_no 추가로 모두 가져옴
				Flight f = new Flight();//받을 객체
										
				if(f1.getTo()==null) {
				//	if(f1.getTo().equals("To Anywhere")) {
System.out.println(rset.getString("ROUTE_NO"));
					f.setRoute_no(rset.getString("ROUTE_NO"));//DB 에서 생성된 자동으로 숫자 들어갈 항목(시퀀스)
					f.setFrom(f1.getFrom());//검색 그대로 다시 가져옴(보여줌)			//출발지 필수!
					f.setTo(rset.getString("TO"));//자유여행으로 검색하면 도착지 정보가 없으므로 db에서 긁어오기
					//f.setDeparture(f1.getDeparture());                         //출발 시간 필수!
					//f.setArrival(rset.getDate("ARRIVAL"));				
//					f.setDeparture(rset.getString("DEPARTURE")); 
//					f.setArrival2(rset.getString("ARRIVAL"));
					
					
					String temp1 = rset.getString("DEPARTURE");
					String temp2 = rset.getString("ARRIVAL");
			
						f.setDeparture(temp1.substring(0,19));	
						f.setArrival2(temp2.substring(0,19));	
					
					
					
					list.add(f);
					System.out.println("리스트 결과 1줄"+f);//anywhere
				} else {
				f.setRoute_no(rset.getString("ROUTE_NO"));//DB 에서 생성된 자동으로 숫자 들어갈 항목(시퀀스)
				f.setFrom(f1.getFrom());//검색 그대로 다시 가져옴(보여줌)
				f.setTo(f1.getTo());
				
				
				
				
				//f.setDeparture(f1.getDeparture());얘는 그냥 넣었던 값만 가져옴
				//f.setArrival(rset.getDate("ARRIVAL"));얘는 시간빼고 날짜만 가져옴	
//				f.setDeparture(rset.getString("DEPARTURE")); //departure은 String
//				f.setArrival2(rset.getString("ARRIVAL"));//arrival2가 String
	
				
				String temp1 = rset.getString("DEPARTURE");
				String temp2 = rset.getString("ARRIVAL");
		
					f.setDeparture(temp1.substring(0,19));	
					f.setArrival2(temp2.substring(0,19));	
				
				
				list.add(f);
				
				System.out.println("리스트 결과 1줄"+f);

				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
//		System.out.println(list);
		return list;
	}
	
	




	public Flight selectOne(Connection con, String route_no) {
		
		Flight result = new Flight();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM FLIGHTLIST WHERE ROUTE_NO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, route_no);
			
			rset = pstmt.executeQuery();
			

			while(rset.next()) {
										
					result.setFrom(rset.getString("FROM"));//검색 그대로 다시 가져옴(보여줌)			//출발지 필수!
					result.setTo(rset.getString("TO"));//자유여행으로 검색하면 도착지 정보가 없으므로 db에서 긁어오기
//					result.setDeparture(rset.getString("DEPARTURE"));                         //출발 시간 필수!
//			//		result.setArrival(rset.getDate("ARRIVAL"));				
//					result.setArrival2(rset.getString("ARRIVAL"));	//시간까지 전부 STRING으로 가져올 수 있음!	

			
					String temp1 = rset.getString("DEPARTURE");
					String temp2 = rset.getString("ARRIVAL");
			
						result.setDeparture(temp1.substring(0,19));	
						result.setArrival2(temp2.substring(0,19));	

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
//		System.out.println(list);
		return result;
	}

}















package com.hw.reservation.model.dao;

//슬래시 , 데이터 잘림 모두 insert에서 문제가 있음!! sql 문제x 자바에서 데이터 바뀜(jsp?!)





import static com.hw.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.hw.flight.model.vo.Flight;
import com.hw.member.model.exception.MemberException;
import com.hw.notice.model.vo.Notice;
import com.hw.reservation.model.vo.Reservation;
//여기서 필요한 삽입은 리스트로 하는게 아니라 각각/SELECT가 리스트로 가져옴
public class ReserveDao {

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS"); //SSS가 밀리세컨드 표시
    //회사 규모가 커지면 고유 번호 존재하는지 확인하고 다시 배정하는 코드 추가
    Calendar calendar = Calendar.getInstance();
    
   // System.out.println(dateFormat.format(calendar.getTime()));

    public String PMR_no = dateFormat.format(calendar.getTime());
    //같은 탑승객 번호 공유!
	
	
	//주의할것!!! 띄어쓰기,/ 등 sql에서 이용하는 기호이기 때문에 무조건 다른식으로 감싸주거나 해야 db에 잘 삽입됨!
	
	
	
	public int insertReserve(Connection conn, Reservation r) {
		
		//여기서 예약 정보 들어가면서, 비회원의 경우 따로 모아진 곳에 자동 회원가입 되도록하고.
		//회원의 경우, jsp에서 예약정보 조회해서 있으면 띄워주는 식
		

	
		
		//1. 우선 회원 기준
		// 처리된 결과의 결과를 받아줄 변수 선언(처리된 행의 갯수)
		int result = 0;
		
		PreparedStatement pstmt = null;
		//context.xml / properties / db-연결정보 확인-
		String sql = "INSERT INTO RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)";
		
		//이유는 아직 모르겠지만 여기까지 오는데 /같이 이어옴! = > jsp 문제?!//우선 슬래시 임시 해결
		r.setRoute_no(r.getRoute_no().replaceAll("/", ""));
		r.setTitle(r.getTitle().replaceAll("/", ""));
		r.setName(r.getName().replaceAll("/", ""));
		r.setPhone(r.getPhone().replaceAll("/", ""));

		r.setPclass(r.getPclass().replaceAll("/", ""));
		r.setSeat(r.getSeat().replaceAll("/", ""));
		r.setLuggage(r.getLuggage().replaceAll("/", ""));
		r.setMeal(r.getMeal().replaceAll("/", ""));

		r.setTo(r.getTo().replaceAll("(\\r\\n|\\r|\\n|\\n\\r)", " "));
		r.setFrom(r.getFrom().replaceAll("(\\r\\n|\\r|\\n|\\n\\r)", " "));
//jsp 띄어쓰기 방식?!
		
		//r.getRoute_no() = value = value.replaceAll("(\r\n|\r|\n|\n\r)", " ");
		//총 20 + 1+1개의 각 분리 정보
		
		//시퀀스?필요?!
		try {
			pstmt = conn.prepareStatement(sql);
			//.replaceAll(" ", "&nbsp;").replaceAll("", "/").replaceAll(" ", ",").replaceAll("\n", "<br>"));
			pstmt.setString(1, PMR_no);
			pstmt.setString(2, r.getRoute_no());
			pstmt.setString(3, r.getFrom());
			pstmt.setString(4, r.getTo());
			pstmt.setString(5, r.getDeparture());
			pstmt.setString(6, r.getArrival2());
			
			pstmt.setString(7, r.getEmail());
			pstmt.setString(8, r.getTitle());
			pstmt.setString(9, r.getName());
			pstmt.setString(10, r.getC_code());
			pstmt.setString(11, r.getPhone());
			pstmt.setString(12, r.getAddress());
			
			pstmt.setString(13, r.getPclass());
			pstmt.setString(14, r.getMeal());
			pstmt.setString(15, r.getSeat());
			pstmt.setString(16, r.getLuggage());

			pstmt.setString(17, r.getOwner());
			pstmt.setString(18, r.getCard_no());
			pstmt.setString(19, r.getMm());
			pstmt.setString(20, r.getYy());
			pstmt.setString(21, r.getCvc());

		//---------------------------------------------
		
			//회원 화면표시용도//이렇게 안하면 select또 해야함! 정보 가져와야 하므로!
			r.setPMR_no(PMR_no);
	        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");//string 형식?!
//	        Date reserve_date = (Date) calendar.getTime();
	        String reserve_date = dateFormat2.format(calendar.getTime());
	        r.setReserveDate2(reserve_date);
		
	        
	        //System.out.println("여기부터 슬래쉬 들어감"+r);

			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
				
	}

	
	
	
	
	public int insertReserve2(Connection conn, Reservation r) {
	
		
	
		// 처리된 결과의 결과를 받아줄 변수 선언(처리된 행의 갯수)
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO M_RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)";
		//MEMBER

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, PMR_no);
			pstmt.setString(2, r.getRoute_no());
			pstmt.setString(3, r.getFrom());
			pstmt.setString(4, r.getTo());
			pstmt.setString(5, r.getDeparture());
			pstmt.setString(6, r.getArrival2());
			
			pstmt.setString(7, r.getEmail());
			pstmt.setString(8, r.getTitle());
			pstmt.setString(9, r.getName());
			pstmt.setString(10, r.getC_code());
			pstmt.setString(11, r.getPhone());
			pstmt.setString(12, r.getAddress());
			
			pstmt.setString(13, r.getPclass());
			pstmt.setString(14, r.getMeal());
			pstmt.setString(15, r.getSeat());
			pstmt.setString(16, r.getLuggage());

			pstmt.setString(17, r.getOwner());
			pstmt.setString(18, r.getCard_no());
			pstmt.setString(19, r.getMm());
			pstmt.setString(20, r.getYy());
			pstmt.setString(21, r.getCvc());

		//---------------------------------------------
		
			//회원 화면표시용도//이렇게 안하면 select또 해야함! 정보 가져와야 하므로!
			r.setPMR_no(PMR_no);
	        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");//string 형식?!
	        String reserve_date = dateFormat2.format(calendar.getTime());
	        r.setReserveDate2(reserve_date);
			

			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
				
	}
	
	
	public int insertReserve3(Connection conn, Reservation r) {
		

	
		// 처리된 결과의 결과를 받아줄 변수 선언(처리된 행의 갯수)
		int result = 0;
		
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO NM_RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)";
		//NON-MEMBER

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, PMR_no);
			pstmt.setString(2, r.getRoute_no());
			pstmt.setString(3, r.getFrom());
			pstmt.setString(4, r.getTo());
			pstmt.setString(5, r.getDeparture());
			pstmt.setString(6, r.getArrival2());
			
			pstmt.setString(7, r.getEmail());
			pstmt.setString(8, r.getTitle());
			pstmt.setString(9, r.getName());
			pstmt.setString(10, r.getC_code());
			pstmt.setString(11, r.getPhone());
			pstmt.setString(12, r.getAddress());
			
			pstmt.setString(13, r.getPclass());
			pstmt.setString(14, r.getMeal());
			pstmt.setString(15, r.getSeat());
			pstmt.setString(16, r.getLuggage());

			pstmt.setString(17, r.getOwner());
			pstmt.setString(18, r.getCard_no());
			pstmt.setString(19, r.getMm());
			pstmt.setString(20, r.getYy());
			pstmt.setString(21, r.getCvc());

		//---------------------------------------------
		
			//회원 화면표시용도//이렇게 안하면 select또 해야함! 정보 가져와야 하므로!
			r.setPMR_no(PMR_no);
	        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");//string 형식?!
	        String reserve_date = dateFormat2.format(calendar.getTime());
	        r.setReserveDate2(reserve_date);
			

			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
				
	}


	
	//------------------------------------------------------------------ 여기까지 전체/회원/비회원 관리자용 예약 DB 생성
	//테이블만 생성할 용도 데이터는 안들어감!
	//예약한 탑승객의 테이블 생성
	public int createTable(Connection conn, Reservation r) {

		//.com, .co.kr 문제 일으킴(sql) 따라서 최소 뒷문자6자 잘라서 고유 테이블
		
		String new_id=r.getEmail().substring(0, r.getEmail().length()-6);
		//1. 테이블 명 정하기!
		new_id = new_id.replaceAll("@", "");
		System.out.println(new_id+" <- 멤버의 예약 테이블 이름");
		
		String mtable = "M"+new_id;//테이블 고유명! - ex) Mchuva22nave
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		
		
		
//		테이블 생성만 해결되면 오키  --> 여기서 생성후 MemberReserveController 들어가서 그 페이지로 올때, 가져올 정보를
 								//접속한 멤버 아이디로 select 해서 보여주기!
		
			//칸 띄우기 중요! 자바 ~> sql
		String sql = "CREATE TABLE DOLPHIN."+mtable+
		"(PMR_NO VARCHAR2(40 BYTE),"+ 	
	    "ROUTE_NO VARCHAR2(30 BYTE),"+ 
	    "FROM VARCHAR2(40 BYTE),"+ 
	    "TO VARCHAR2(40 BYTE),"+ 
	 	"DEPARTURE VARCHAR2(40 BYTE),"+
	 	"ARRIVAL VARCHAR2(40 BYTE),"+
	     
	    "EMAIL VARCHAR2(40 BYTE),"+ 	
	    "TITLE VARCHAR2(30 BYTE),"+ 
	    "NAME VARCHAR2(30 BYTE),"+ 
	    "C_CODE VARCHAR2(30 BYTE),"+ 
	 	"PHONE VARCHAR2(40 BYTE),"+
	 	"ADDRESS VARCHAR2(40 BYTE),"+
	     
	  	"PCLASS VARCHAR2(40 BYTE),"+ 	
	    "MEAL VARCHAR2(30 BYTE),"+ 
	    "SEAT VARCHAR2(30 BYTE),"+
	    "LUGGAGE VARCHAR2(40 BYTE),"+
	     
	 	"OWNER VARCHAR2(30 BYTE),"+
	 	"CARD_NO VARCHAR2(40 BYTE),"+
	 	"MM VARCHAR2(20 BYTE),"+
	 	"YY VARCHAR2(20 BYTE),"+
	    "CVC VARCHAR2(20 BYTE),"+
	    "RESERVEDATE DATE DEFAULT SYSDATE)";
		
		
		
		
		

		try {
			pstmt = conn.prepareStatement(sql);
		
			result = pstmt.executeUpdate();
			System.out.println("breakpoint-create table");

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//------------------------------------------------------------------------------------------------------
	
	//create table 한 곳에 들어감!
	//멤버면 같은 테이블로 들어가고/비회원은 그때그때 한번씩만 삽입됨!
	public int insertTable(Connection conn, Reservation r) {//똑같은데 단지 각 탑승객 별로 제작된 테이블에 정보가 따로 관리되어서 출력될 예정
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String new_id=r.getEmail().substring(0, r.getEmail().length()-6);
		//1. 테이블 명 정하기!
		new_id = new_id.replaceAll("@", "");
		String mtable = "M"+new_id;//테이블 고유명!

		
		

		String sql = "INSERT INTO "+mtable+" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)";
		

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, PMR_no);
			pstmt.setString(2, r.getRoute_no());
			pstmt.setString(3, r.getFrom());
			pstmt.setString(4, r.getTo());
			pstmt.setString(5, r.getDeparture());
			pstmt.setString(6, r.getArrival2());
			
			pstmt.setString(7, r.getEmail());
			pstmt.setString(8, r.getTitle());
			pstmt.setString(9, r.getName());
			pstmt.setString(10, r.getC_code());
			pstmt.setString(11, r.getPhone());
			pstmt.setString(12, r.getAddress());
			
			pstmt.setString(13, r.getPclass());
			pstmt.setString(14, r.getMeal());
			pstmt.setString(15, r.getSeat());
			pstmt.setString(16, r.getLuggage());

			pstmt.setString(17, r.getOwner());
			pstmt.setString(18, r.getCard_no());
			pstmt.setString(19, r.getMm());
			pstmt.setString(20, r.getYy());
			pstmt.setString(21, r.getCvc());

		//---------------------------------------------
		
			r.setPMR_no(PMR_no);
	        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
	        String reserve_date = dateFormat2.format(calendar.getTime());
	        r.setReserveDate2(reserve_date);
			
			result = pstmt.executeUpdate();
			
			System.out.println("breakpoint-insert table");

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}





	





	public Flight selectFlight(Connection con, String route_no) {
		Flight result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		route_no = route_no.replaceAll("/", "");

		String sql = "SELECT * FROM FLIGHTLIST WHERE ROUTE_NO = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, route_no);

			rset = pstmt.executeQuery(); // select는 execute
/*시간은 없는 이유?!*/
			while(rset.next()) {
				result = new Flight();
				result.setRoute_no(route_no);
				result.setFrom(rset.getString("FROM"));
				result.setTo(rset.getString("TO"));
				result.setDeparture(rset.getString("DEPARTURE"));
				result.setArrival2(rset.getString("ARRIVAL"));
				System.out.println("해당 항공권: "+result);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return result ;
	}




	public int updateOption(Connection con, Reservation r) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			System.out.println("에러 못잡음 - 옵션 수정 안되는 이유?"+r.toString());
			String sql = "UPDATE DOLPHIN.RESERVATION SET SEAT=?, MEAL=?, LUGGAGE=? WHERE PMR_NO=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, r.getSeat());
			pstmt.setString(2, r.getMeal());
			pstmt.setString(3, r.getLuggage());
			pstmt.setString(4, r.getPMR_no());

			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
			
		}
		
		return result;
		}




	

}

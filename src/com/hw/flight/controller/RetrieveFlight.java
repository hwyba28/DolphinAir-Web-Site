package com.hw.flight.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.flight.model.service.FlightService;
import com.hw.flight.model.vo.Flight;


@WebServlet("/RetrieveFlight.me")
public class RetrieveFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RetrieveFlight() {
        super();
    }



    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String depart = request.getParameter("departure");
		String departure = depart.substring(2); 
		
		Flight f = null;
		if(to.equals("To Anywhere"))//to 자유여행 여부//들어갈땐 Anywhere but 조회후 데이터 가지고 와야함! 
//		if(to==null)
		f = new Flight(from,departure);//여기서부터 TO ANYWHERE은 NULL값이 됨!
		else
			f = new Flight(from,to,departure);//전달할 객체 생성 성공
		
		
		
		

//		String depart = request.getParameter("departure");

//		String depart = "0";
//		depart += request.getParameter("departure");
		
	//	System.out.println(depart);
		
//		String arrive = request.getParameter("arrival");//도착날짜로는 검색x
		
//		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//		String departure = formatter.format(depart);


//		String date = "1/13/2012";
//		LocalDate lastDayOfMonth = LocalDate.parse(date,DateTimeFormatter.ofPattern("M/dd/yyyy"));
		//System.out.println(date);
		                 //substring 원본값 보존?!           	                               

		

//	System.out.println(departure);
		                               
		               //굳이 데이터 형식으로 가져올 필요 없음
	
	//DB에서는 있는 정보 그대로 스트링으로 가져올것이고, 삽입하는게 아니기 때문에..
	//찾는 정보는 그대로 STRING으로 보여주기만 하고.. 삽입!!XXXXX
		//우선 날짜만! //연동위해 sql.date로!
		/*java.time.LocalDate departure = formatter.parse(depart);*/
		
//		java.sql.Date departure = java.sql.Date.valueOf(depart);
//		java.sql.Date arrival = java.sql.Date.valueOf(arrive);
		
//		if(to.equals("To Anywhere")) { f= new Flight(from,departure);}//자유여행 용
//		else { f = new Flight(from,to,departure);}
		
	
		
		
		
		FlightService fs = new FlightService();

		ArrayList<Flight> list = new ArrayList<Flight>();//전달 받을 객체 준비
		list = fs.selectList(f);
		
		String page = "";
		//System.out.println(list);
		
		
		if(list != null) {
			page = "views/detail/flight/flightList1.jsp";//커밋!OR 롤백!해야 데이터베이스와 연결시 적용됨!!
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "항공 목록 에러!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}
		
		
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

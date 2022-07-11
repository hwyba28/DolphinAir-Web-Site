package com.hw.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.member.model.exception.MemberException;
import com.hw.reservation.model.service.ReserveService;
import com.hw.reservation.model.vo.Reservation;
import com.hw.flight.model.vo.Flight;

//4번에서 결제하기 누르면 5번으로 넘어가기 전에! 전체 정보 가져오고, Date 2개 형성해서 insert!! 후 redirect 완료 페이지


//+추가 정보 들어오면 전체 테이블에 삽입 / 멤버 개인 예약 테이블 만들기!
@WebServlet("/Reserve.do")
public class ReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ReserveController() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 
	
		
		// 1. 인코딩


		Reservation r = new Reservation();

			r.setRoute_no(request.getParameter("route_no"));
			r.setFrom(request.getParameter("from"));
			r.setTo(request.getParameter("to"));
			r.setDeparture(request.getParameter("departure"));
			r.setArrival2(request.getParameter("arrival"));
			
			r.setEmail(request.getParameter("email"));
			r.setTitle(request.getParameter("title"));
			r.setName(request.getParameter("name"));
			r.setC_code(request.getParameter("c_code"));
			r.setPhone(request.getParameter("phone"));
			r.setAddress(request.getParameter("address"));
			
			
			r.setPclass(request.getParameter("pclass"));
			r.setMeal(request.getParameter("meal"));
			r.setSeat(request.getParameter("seat"));
			r.setLuggage(request.getParameter("luggage"));

			//---------------------------------------------
			
			
			r.setOwner(request.getParameter("owner"));
			r.setYy(request.getParameter("yy"));
			r.setMm(request.getParameter("mm"));
			r.setCvc(request.getParameter("cvc"));
			r.setCard_no(request.getParameter("card_no"));
			
			
		//	System.out.println("여기는 예약 완료 컨트롤러:"+r);
			
			String memberId = request.getParameter("memberId");
			
			ReserveService rs = new ReserveService();			
///전체 예약조회 말고, 여기서 회원 /비회원 정보에도 예약 정보 따로 저장(INSERT)해야됨

			try {
				Flight flight = rs.selectFlight(r,request.getParameter("route_no"));//selectFlight 결과조회
				rs.insertReserve(r);//전체 예약 목록 삽입
				//결과가 int 그러나 r의 내용은 바뀌어 있음!
				
				//덮어쓰기
				r.setFrom(flight.getFrom());
				r.setTo(flight.getTo());
				r.setArrival2(flight.getArrival2());
				r.setDeparture(flight.getDeparture());
				
				
				
				
				
				//항공목록이 시간등 잘 안 떠서 그냥 해당하는 route 번호로 항공권 따로 가져오기
				//insertFlight가 아니라 selectFlight 해서 항공정보를 가져온 다음 insertReserve해야 시간 arrival 날짜등 잘 들어감 
				
//				rs.createTable(r);//회원 또는 비회원 정보 테이블 생성 먼저!
//
//				rs.insertTable(r);//회원 또는 비회원 정보 테이블로 삽입!

				System.out.println("예약 DB 저장 완료");
				//member 인지 확인 후에 둘중 한군데만 삽입되면 됨!
				
				
				//그냥 테이블 만들지 말고 전체 비회원/테이블에서 각각 가져오기
				//일단 회원테이블에서만 아이디 일치하는 정보 가져오기! MemberReserveController에서
				if(memberId != null)
				rs.insertReserve2(r);//회원은 여러개의 예약을 가지므로 여기서 다 저장되있으면 다른 servlet에서 db 불러와서 list로 만들어줘야함!
				else
				rs.insertReserve3(r);

				
				HttpSession session = request.getSession();//상태 공유!!!!!!!
				session.setAttribute("reserve", r);//세션 여러개?! // 세션 이름?!
				//count = 0;
				response.sendRedirect("/myWeb/views/main/moment.html");
				//Spring security 이용?! - 현재페이지 로드 / 
				//count = -1;
			}catch(MemberException e) {
				request.setAttribute("msg", "회원 가입 중 에러 발생");
				request.setAttribute("exception", e);
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
					
	}
			


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

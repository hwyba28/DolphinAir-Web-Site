package com.hw.reservation.controller;


//미완성 - 수정 DB로 안들어감!!!//그리고 뽑아올때도 DB에 있는 내용 처음빼고는 안 뽑아옴 MEMBERRESERVECONTROLLER도 살펴보기



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.member.model.vo.Member;
import com.hw.reservation.model.service.ReserveService;
import com.hw.reservation.model.vo.Reservation;

/**
 * Servlet implementation class EditOptionController
 */
@WebServlet("/editOption.do")
public class EditOptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditOptionController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String meal = request.getParameter("meal");
		String luggage = request.getParameter("luggage");
		String seat = request.getParameter("seat");
		String PMR_no = request.getParameter("PMR");
		
		String omeal = request.getParameter("omeal");
		String oluggage = request.getParameter("oluggage");
		String oseat = request.getParameter("oseat");

		Reservation r = new Reservation();
		
//		HttpSession session = request.getSession(false);
//		Member m = (Member)session.getAttribute("member");
		
		if(meal.equals("0"))
			r.setMeal(omeal);
		else
			r.setMeal(meal);
		if(luggage.equals("0"))
			r.setLuggage(oluggage);
		else
			r.setLuggage(luggage);
		if(seat.equals("0"))
			r.setSeat(oseat);
		else
			r.setSeat(seat);
		
		ReserveService rc = new ReserveService();
		
		r.setPMR_no(PMR_no);//
		
		
		
		
		try {//servlet에서 servlet 호출시  multi request(파일전송할때랑 비슷) get/post변하면 상관?!
			rc.updateOption(r); 

			System.out.println("예약 옵션 수정 완료!");
//			session.setAttribute("reserve", r);
//			session.setAttribute("reserve_list", list);//혹시 얘도 그 세션에서 받아올수 있었나 ㅜㅜ 굳이 한번더 작성 안하고..

			response.setContentType("text/html; charset=UTF-8");
			//System.out.println("옵션 변경 사항만"+r.toString());

			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
			resultMsg += "alert('😃옵션 수정이 완료되었습니다.');document.location.href = '/myWeb/MemberReserve.co';";
			resultMsg += "</script>";
			out.print(resultMsg);
			out.flush();

//			response.sendRedirect("/myWeb/MemberReserve.co");
			//sendRedirect를 servlet으로 가야하나?!

		}catch(Exception e) {
			request.setAttribute("msg", "옵션 수정 중 에러 발생");
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

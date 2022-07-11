package com.hw.member.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.member.model.vo.Member;
import com.hw.member.reserve.model.service.MemberReserveService;
import com.hw.reservation.model.vo.Reservation;
//받아오는곳, 나의 예약 버튼 누를수 있는 두 곳
//myPage내의 나의 예약
//예약완료Complete5 후 나의 예약

//뿌려주는 곳 myReservation


/**
 * Servlet implementation class MemberReserveController
 */
@WebServlet("/MemberReserve.co")
public class MemberReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReserveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//여기서 접속중인 멤버 정보를 전달해야 그에 따라서 select where 쿼리를 진행하고
		//그 멤버 전용 예약 관리 테이블을 가져옴
		
		
		//나의 예약은 회원이든 비회원이든 로그인 후 할수 있으므로 모두 userId(email)이 존재함!
	//	String userId = request.getParameter("userId");

		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		//System.out.println("test1"+userId);
		
		
		MemberReserveService mrs = new MemberReserveService();
		//ArrayList<Reservation> list = new ArrayList<>();//나중에 null값을 사용하려고 이런식으로 초기화 안함??!
		ArrayList<Reservation> list = null;

		
		String page = "";
		//System.out.println(list);//현재 null값 -> 해결 잘 들어옴!
	
		//list = mrs.selectList(userId);
		list = mrs.selectList(m.getUserId());
		if(list != null) {

			page = "views/detail/myTrip/myReservation.jsp";
			request.setAttribute("reserve_list", list);//ATTRIBUTE이름은 다르게? 세션 공유하므로?!
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 예약 목록 불러오기 에러!");
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

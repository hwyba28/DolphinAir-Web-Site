package com.hw.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.member.model.exception.MemberException;
import com.hw.member.model.service.MemberService;
import com.hw.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mDelete.me")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		String userId = ((Member)session.getAttribute("member")).getUserId();//세션-들어가있는 현재 접속 아이디 삭제 예정
		
		System.out.println("탈퇴를 원하는 아이디 : " + userId);
		
		MemberService ms = new MemberService();
		
		try {
			
			//response.setContentType("text/html; charset=UTF-8");

			//int result = ms.deleteMember(userId);
			ms.deleteMember(userId);		 //error위치
			System.out.println("회원 탈퇴  성공!");
			
			response.sendRedirect("/myWeb/views/main/index.jsp");
		
			session.invalidate();
		
			
			
			
		}catch(MemberException e) {
			request.setAttribute("msg", "회원 탈퇴 수행 중 에러 발생");
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

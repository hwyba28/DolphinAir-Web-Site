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


@WebServlet("/login2.me")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public LoginServlet2() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		String rev = request.getParameter("userId");
		String pwd= request.getParameter("userPwd");

		Member m = new Member(rev,pwd);
		//System.out.println(m);
		MemberService ms = new MemberService();

		try { // 로그인 성공했을 때
			m = ms.selectMember(m);
			System.out.println("회원 로그인 성공!");
			HttpSession session = request.getSession();//로그인 상태유지!!!!!!!!!!
			session.setAttribute("member", m);
			response.sendRedirect("/myWeb/views/detail/myTrip/myPage.jsp");

		} catch (MemberException e) {//로그인 실패시
			request.setAttribute("msg", "회원 로그인 실패!");
			request.setAttribute("exception", e);
		
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
			resultMsg += "alert('🥺이메일 또는 비밀번호를 재확인 해주세요'); document.location.href = '/myWeb/views/detail/myTrip/myTrip.jsp'";

			
			resultMsg += "</script>";
			out.print(resultMsg);
			out.flush();
			
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





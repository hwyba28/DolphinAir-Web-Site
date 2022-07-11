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


@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public LoginServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd= request.getParameter("userPwd");

		Member m = new Member(userId,userPwd);

		MemberService ms = new MemberService();
//System.out.println(m);
		try { // 로그인 성공했을 때
			m = ms.selectMember(m);
			System.out.println("회원 로그인 성공!");
			HttpSession session = request.getSession();//로그인 상태유지!!!!!!!!!!
			session.setAttribute("member", m);
			response.sendRedirect("/myWeb/views/main/index.jsp");

		} catch (MemberException e) {//로그인 실패시
			request.setAttribute("msg", "회원 로그인 실패!");
			request.setAttribute("exception", e);
//			request
//			.getRequestDispatcher("views/common/errorPage.jsp")
//			.forward(request, response);		
			response.setContentType("text/html; charset=UTF-8");

			
			//API?? 이용-메일/연동/
			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
	//		resultMsg += "alert('🥺이메일 또는 비밀번호를 재확인 해주세요'); document.location.href = '/myWeb/views/main/index.jsp'";
			resultMsg += "alert('🥺이메일 또는 비밀번호를 재확인 해주세요'); setTimeout(function(){document.location.href = history.go(-1);}, 180); "; 
			System.out.println("로그인 실패");
			
			resultMsg += "</script>";
			out.print(resultMsg);
			//out.print("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\">$(\"#auto\").trigger('click');</script>");
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





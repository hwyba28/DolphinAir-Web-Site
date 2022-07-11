package com.hw.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.member.model.exception.MemberException;
import com.hw.member.model.service.MemberService;
import com.hw.member.model.vo.Member;


@WebServlet("/mInsert2.me")
public class MemberInsertServlet2 extends HttpServlet {

	//public static int count = -1;
	
	private static final long serialVersionUID = 1L;
       
    
    public MemberInsertServlet2() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userId = request.getParameter("userId");
		String userPwd= request.getParameter("userPwd");
		

		Member m = new Member(userId,userPwd);
		
		System.out.println("※신규회원정보 \n"+m.toString());
		MemberService ms = new MemberService();
		try {
			ms.insertMember(m);//에러1
			System.out.println("회원 가입 완료");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
			resultMsg += " alert('환영합니다. 가입이 완료되었습니다😄'); document.location.href = '/myWeb/views/detail/myTrip/myTrip.jsp';";
			resultMsg += "</script>";
			out.print(resultMsg);
			out.flush();
			
			//response.sendRedirect("/myWeb/views/detail/myTrip/myTrip.jsp");

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

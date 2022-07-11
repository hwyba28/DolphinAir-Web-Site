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


@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {

	//public static int count = -1;
	
	private static final long serialVersionUID = 1L;
       
    
    public MemberInsertServlet() {
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
			//count = 0;
			response.sendRedirect("/myWeb/views/main/index.jsp");
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

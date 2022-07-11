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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pwd= request.getParameter("userPwd");
		//System.out.println(pwd);
		String title= request.getParameter("title");
		String name = request.getParameter("name");
		String c_code = request.getParameter("c_code");
		String phone = request.getParameter("tel");
		/*String address = request.getParameter("zipCode")+","
				       + request.getParameter("address1")+","
				       + request.getParameter("address2");
		*/
		String address = request.getParameter("address");
		
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		/*
		String[] arr = new String[8];
		for(int i=0; i<arr.length; i++)
		if(arr[i].equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg=="))
			m.setAddress(address);
		*/
		
		//패스워드만 암호화됨!! 나머지는 그냥 null값!!

		if(pwd.equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg=="))
			m.setUserPwd(m.getUserPwd());
		else
			m.setUserPwd(pwd);
		
		if(name.equals(""))
			m.setUserName(m.getUserName());
		else
			m.setUserName(name);
		
		if(phone.equals(""))
			m.setPhone(m.getPhone());
		else
			m.setPhone(phone);
		
		if(address.equals(""))
			m.setAddress(m.getAddress());
		else
			m.setAddress(address);
		
//		m.setUserName(name);
		m.setTitle(title);
		m.setC_code(c_code);
//		m.setPhone(phone);
//		m.setAddress(address);
//위에서 안 쓰면 원래 값 들어가는 식 있음!
		
		//들어온 정보가 ""이냐 null 이냐 암호화 되었냐 잘 따지기!System.out.println(name+m.getUserName());
		System.out.println("변경할 회원 정보 확인 : " + m.toString2());

		MemberService ms = new MemberService();
		
		try {
			ms.updateMember(m); //갑자기 잘되다가 에러 발생1
			//int result = ms.updateMember(m);
			System.out.println("회원 정보 수정 완료!");
			session.setAttribute("member", m);
		//	response.sendRedirect("index.jsp");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
			resultMsg += "alert('😃회원 정보 수정이 완료되었습니다.'); document.location.href = '/myWeb/views/detail/myTrip/myPage.jsp'";
			resultMsg += "</script>";
			out.print(resultMsg);
			out.flush();
			
		}catch(MemberException e) {
			
			m.setUserName("");
			m.setTitle("---");
			m.setC_code("국가 코드");
			m.setPhone("");
			
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			String resultMsg = "";
			resultMsg += "<script type='text/javascript'>";
			resultMsg += "alert('이름 또는 휴대번호 변경시, 타이틀과 국가 선택은 필수입니다.<br>기본값이 선택됩니다.'); document.location.href = '/myWeb/views/detail/myTrip/myPage.jsp'";
			resultMsg += "</script>";
			out.print(resultMsg);
			out.flush();

			
			
//			request.setAttribute("msg", "회원 정보 수정 중 에러 발생");
//			request.setAttribute("exception", e);
//			
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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

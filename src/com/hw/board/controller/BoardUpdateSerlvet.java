package com.hw.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hw.board.model.service.BoardService;
import com.hw.board.model.vo.Board;
import com.hw.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/////////////////////////////여기가 수정 완료 눌렀을때 실행하는 서블릿!
/**
 * Servlet implementation class BoardUpdateSerlvet
 */
@WebServlet("/bUpdateComplete.bo")
public class BoardUpdateSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String bno1 = request.getParameter("board_no");
		
		//System.out.println("없나 값이?"+bno1);
		
		int bno = Integer.parseInt(bno1);
		Board b = new Board();
		
		if(email.equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg=="))	
		b.setBwriterId(b.getBwriterId());
		else
			b.setBwriterId(email);
		
		//Board b = new Board();
		b.setBno(bno);
		b.setBtitle(title);
		b.setBcontent(content);
		//b.setBwriterId(email); 이메일은 수정 없으면 그대로 들어감!
		
		System.out.println("수정 데이터 : " + b);
		// 7. 서비스 결과 처리하기
		int result = new BoardService().updateBoard(b);
		
		if( result > 0) {
			response.sendRedirect("selectOne.bo?bno="+bno);//다시 디테일 띄워 주세용 수정후!
		} else {
			request.setAttribute("msg", "게시글 수정 실패!");
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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

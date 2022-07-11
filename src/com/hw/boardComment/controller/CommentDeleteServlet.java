package com.hw.boardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hw.board.model.vo.Board;
import com.hw.boardComment.model.service.BoardCommentService;
import com.hw.boardComment.model.vo.BoardComment;
import com.hw.member.model.exception.MemberException;
import com.hw.member.model.service.MemberService;
import com.hw.member.model.vo.Member;

/**
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/comDelete.do")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //이미 들어올 때, member이미 구분해서 member 일치경우만 여기 서블릿으로 들어오고 안되면 js로 권한 박탈로 못들어옴!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//parse파싱 파라미터 문자열로 가져와서,
		
		int bno = Integer.parseInt(request.getParameter("bno"));//현재 게시글 번호와 코멘트 번호만 데려오면 됨
		int cno = Integer.parseInt(request.getParameter("cno"));
		
//		Board b = null;
//		BoardComment c = null;
		BoardCommentService bs = new BoardCommentService();
		
		try {
//			b = new Board();
//			c = new BoardComment();
			bs.deleteComment(bno,cno);		 //error위치
			System.out.println("코멘트 삭제 성공");
			//response.sendRedirect("");//ajax로 해당 요청페이지로 그대로 유지되야하고, 화면 redirect가 되면 안됨!
		
			response.sendRedirect("selectOne.bo?bno="+bno);
			
			
		}catch(Exception e) {
			request.setAttribute("msg", "댓글 삭제 중 에러 발생");
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

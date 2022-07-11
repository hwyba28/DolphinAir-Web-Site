package com.hw.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.board.model.service.BoardService;
import com.hw.board.model.vo.Board;
//수정 화면
/**
 * Servlet implementation class BoardUpdateViewServlet
 */
@WebServlet("/bUpView.bo")
public class BoardUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		Board b = new BoardService().updateView(bno);//한개 안에 들어가기!
		//얘는 view 보여주기위한 (수정 창 가져와서 띄워주기!)
		String page = "";
		if(b != null) {
			page = "views/board/boardUpdate.jsp";//여기 수정창으로 이동! 보여주기 완료!
			System.out.println("옹이?"+b.getBno());
			request.setAttribute("board", b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정 페이지 조회 실패!");
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

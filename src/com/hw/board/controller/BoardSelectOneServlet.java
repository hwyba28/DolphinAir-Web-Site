package com.hw.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.board.model.service.BoardService;
import com.hw.board.model.vo.Board;
import com.hw.boardComment.model.service.BoardCommentService;
import com.hw.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class BoardSelectOneServlet
 */
@WebServlet("/selectOne.bo")
public class BoardSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int bno = Integer.parseInt(request.getParameter("bno"));
			
			Board b = new BoardService().selectOne(bno);
			ArrayList<BoardComment> clist = new BoardCommentService().selectList(bno);
			
			
			//String bWriterId = request.getParameter("writerId");
			//Board b2 = new BoardService().selectOne2("bWirterId");
			
			String page = "";
			if(b != null) {
				request.setAttribute("board", b);
				request.setAttribute("clist", clist);
				//순서?!
				page = "views/board/boardDetail.jsp";

			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 상세보기 실패!");
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

package com.hw.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hw.board.model.service.BoardService;
import com.hw.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/bInsert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String title = request.getParameter("title");
		String content= request.getParameter("content");
		String name = request.getParameter("name");
		String email = request.getParameter("userId");
		int pwd = Integer.parseInt(request.getParameter("pwd"));
		
	
		Board b = new Board();
		b.setBtitle(title);
		b.setBcontent(content);
		b.setBwriter(name);
		b.setBwriterId(email);
		b.setBpwd(pwd);
		

		int result = new BoardService().insertBoard(b);

		Board board = new BoardService().selectOne2(title);//여기서는 select
		
		//System.out.println("여기는 서블릿="+board);ok
		if(result > 0) {
			request.setAttribute("board", board);//여기가 아니라 list에서 detail로 이동할때 정보가 들어가야 edit 가능
			response.sendRedirect("selectList.bo");

		}else {
			request.setAttribute("msg", "게시글 작성 실패");
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

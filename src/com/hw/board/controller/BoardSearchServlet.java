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
import com.hw.board.model.vo.PageInfo;


/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/searchBoard.bo")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 카테고리
		String category = request.getParameter("con");
		
		// 검색 키워드
		String keyword = request.getParameter("keyword");
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		BoardService bs = new BoardService();
		//
		
		int startPage;
		
		int endPage;
		
		int maxPage;
		
		int currentPage;
		
		int limit;
		
		currentPage = 1;
		
		limit = 10;
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = bs.getListCount();
		System.out.println("총 페이지 개수 : " + listCount);
		
		maxPage = (int)((double)listCount / limit +0.9);
		startPage 
			=    ((int)((double)currentPage/limit+0.9)-1)*limit +1;
             
		endPage = startPage + limit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		
		
		
		
		
		
		//
		
		list = bs.searchBoard(category,keyword,currentPage,limit);
		
		String page = "";
		if(list != null) {
			page = "views/board/Qna.jsp";
			request.setAttribute("list", list);
			
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "Q&A 검색 실패!");
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

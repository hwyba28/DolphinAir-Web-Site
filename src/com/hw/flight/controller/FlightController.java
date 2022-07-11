package com.hw.flight.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.flight.model.service.FlightService;
import com.hw.flight.model.vo.Flight;

/**
 * Servlet implementation class FlightController
 */
@WebServlet("/Flight.go")
public class FlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightController() {
        super();
        // TODO Auto-generated constructor stub
    }

	//받아오기! get
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String route = request.getParameter("route");
		System.out.println(route);//ok!
		
		FlightService fs = new FlightService();
		Flight result = fs.selectOne(route);
		


		
		
				
		String page = "";
		
		
		if(result != null) {
			page = "views/detail/flight/payment4.jsp";//커밋!OR 롤백!해야 데이터베이스와 연결시 적용됨!!
			request.setAttribute("flight", result);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "항공 목록 결과 에러!");
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

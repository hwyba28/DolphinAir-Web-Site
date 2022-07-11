package flightTest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.notice.model.service.NoticeService;
import com.hw.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/selectList.fo")
public class FlightListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 글 여러 개를 받아 목록 형태로
		// (ArrayList형태로) 데이터를 전달하는 서블릿
		ArrayList<Flight> list = new ArrayList<Flight>();
		
		FlightService fs = new FlightService();
		
		list = fs.selectList();
		
		String page = "";
		//System.out.println(list);
		if(list != null) {
			page = "views/detail/flight/flightList.jsp";//커밋!OR 롤백!해야 데이터베이스와 연결시 적용됨!!
			request.setAttribute("list", list);//중요!!!!!!!!! 요청 받을 때 주는 아이!
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "항공 목록 불러오기 에러!");
		}
		request.getRequestDispatcher(page).forward(request, response);

		response.setContentType("text/html; charset=UTF-8");

		
		PrintWriter out = response.getWriter();
		String resultMsg = "";
		resultMsg += "<link rel='stylesheet' href='../views/design/css/progress.css'>";

		out.print(resultMsg);
		out.flush();

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

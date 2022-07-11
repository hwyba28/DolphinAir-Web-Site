package com.hw.ADMIN;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hw.notice.model.service.NoticeService;
import com.hw.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/nInsert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항의 제목, 작성자, 내용
		String ntitle = request.getParameter("title");
		String writer = request.getParameter("userId");
		String content= request.getParameter("content");
		String date = request.getParameter("date");
		System.out.println("날짜 전달 확인 : " + date);
		
		Date writeDate = null; // java.sql.Date
		if(date !="" && date !=null) {
			// 날짜가 들어왔다면
			
			// 2020-08-18 -> 2020,8,18
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			// String --> int
			for(int i=0;i<dateArr.length;i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			writeDate = new Date(new GregorianCalendar(intArr[0],intArr[1]-1,intArr[2])
					.getTimeInMillis());
			
		}else {
			// 날짜가 들어오지 않으면 현재 날짜로 대체
			writeDate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		// 공지사항 등록을 위한 VO객체 만들기
		Notice n = new Notice();
		n.setNtitle(ntitle);
		n.setNwriter(writer);
		n.setNcontent(content);
		n.setNdate(writeDate);
		
		NoticeService ns = new NoticeService();
		int result = ns.insertNotice(n);
		
		if(result > 0) {
			// 공지사항 추가 성공
			response.sendRedirect("selectList.no");
		}else {
			// 공지사항 추가 실패
			request.setAttribute("msg", "공지사항 등록 실패!!");
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

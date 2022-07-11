package com.hw.member.encrypt;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter({ "/login.me", "/login2.me", "/mInsert.me", "/mInsert2.me", "/mUpdate.me" })
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 서블릿 동작하기 전
		HttpServletRequest req = (HttpServletRequest)request;
		
		// 비밀번호 원본값(확인용)
		request.setAttribute("originPwd", req.getParameter("userPwd"));
		//하나만 안돌아가도 ~> 자체 실행을 못함!! getParameter 받는곳 모두 주시~ 모든 연결상태 확인!
		
				
		// Wrapper클래스 연결
		EncryptWrapper lw = new EncryptWrapper(req);
		
		chain.doFilter(lw, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

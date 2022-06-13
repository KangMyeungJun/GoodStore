package kr.co.goodstore.config.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.goodstore.config.Common;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
	String middlePath = Common.MIDDLEPATH;
	HttpSession session =  request.getSession();
	
	if (session.getAttribute("id") == null) {
		response.sendRedirect(middlePath + "/admin/login_form");
		return false;
	}
	return true;	
	}

	

}

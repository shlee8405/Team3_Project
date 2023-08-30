package com.team.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements AsyncHandlerInterceptor{
	
	// 컨트롤러로 가기전에 실행
	// 결과가 true이면 컨트롤러로 간다 false이면 특정 jsp로 간다
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 체크를해서 로그인이 안되어 있는 상태이면 value에 false
		HttpSession session = request.getSession(true);
		// true: 만약 session이 삭제된 상태라면 새로운 session을 생성해 준다
		// 삭제가 안된 상태라면 사용하고 있던 세션을 그대로 전달해 준다
		Object obj = session.getServletContext().getAttribute("sessionUidx");
		if (obj==null) {
			// 로그인하지 않은 상태일 때
			request.getRequestDispatcher("/WEB-INF/views/test/login.jsp").forward(request, response);
			return false;
		}
		return true;
	}
	
	/* 컨트롤로에서 리턴 되어서 뷰 리졸버로 가기전에 실행
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { AsyncHandlerInterceptor.super.postHandle(request,
	 * response, handler, modelAndView); }
	 * 
	 * 뷰 라졸버가 뷰를 찾아서 내보내고 실행
	 * @Override public void afterCompletion(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, Exception ex) throws Exception
	 * { AsyncHandlerInterceptor.super.afterCompletion(request, response, handler,
	 * ex); }
	 */
}
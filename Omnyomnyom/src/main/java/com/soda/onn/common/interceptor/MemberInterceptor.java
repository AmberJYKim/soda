package com.soda.onn.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class MemberInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("회원 전용 페이지에 접근합니다.");
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member) session.getAttribute("memberLoggedIn");
		
		if(memberLoggedIn == null) {
			String msg = "로그인 후 이용하실 수 있습니다.";
			session.setAttribute("msg", msg);
			
			response.sendRedirect(request.getContextPath());
			return false;
		}
		

		return super.preHandle(request, response, handler);
	}
}

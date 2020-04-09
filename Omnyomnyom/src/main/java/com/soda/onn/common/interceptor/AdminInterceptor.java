package com.soda.onn.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("관리자 화면에 접근합니다.");
		
		HttpSession session = request.getSession();
		String memberRoll = ((Member) session.getAttribute("memberLoggedIn")).getMemberRoll();
		
		if(!"A".equals(memberRoll)) {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	
}

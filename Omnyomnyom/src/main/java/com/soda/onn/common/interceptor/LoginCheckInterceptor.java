package com.soda.onn.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		if(memberLoggedIn == null) {
			log.debug("----ChefCheckInterceptor----");
			log.debug("********이곳은 미완성입니다********");
			log.debug("----이곳은 유저만 입장 가능한 주소입니다----");
			log.debug("----ChefCheckInterceptor----");
//			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}

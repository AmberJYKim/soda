package com.soda.onn.common.interceptor;

import lombok.extern.slf4j.Slf4j;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.soda.onn.member.model.vo.Member;


// 셰프회원전용 기능 인터셉터
/*
 * 	작동할 페이지.
 * 	원데이클래스 등록,수정
 * 	레시피 등록, 수정
 *	 	
 * 	
 */
@Slf4j
public class ChefCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		
		if(memberLoggedIn == null || !memberLoggedIn.getMemberRoll().equals("C")) {
			log.debug("----ChefCheckInterceptor----");
			log.debug("********이곳은 미완성입니다********");
			log.debug("----이곳은 셰프만 입장 가능한 주소입니다----");
			log.debug("----ChefCheckInterceptor----");
//			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}

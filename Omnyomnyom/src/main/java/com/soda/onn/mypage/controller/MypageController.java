package com.soda.onn.mypage.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.member.model.vo.Member;
import com.soda.onn.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
public class MypageController {

	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("main")
	public void main() {
		
	}
	
	//회원정보변경 폼 전송
	@GetMapping("update")
	public void update(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("memberLoggedIn");
		
		model.addAttribute("memberLoggedIn", member);
		
	}
	
	
	
	
	
}

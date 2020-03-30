package com.soda.onn.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/buyList")
	public void buyList() {
		
	}
	
	@GetMapping("/chefRequest")
	public void chefRequest() {
		
	}
	
	@GetMapping("/onedayList")
	public void onedayList() {
		
	}
	
	@GetMapping("/qnaMsg")
	public void qnaMsg() {
		
	}
	
	@GetMapping("/scrapList")
	public void scrapList() {
		
	}
}

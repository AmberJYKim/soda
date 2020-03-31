package com.soda.onn.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private MallService mallService;
	
	@GetMapping("/buyList")
	public void buyList(HttpSession session) {
		String memberId = (String) session.getAttribute("");
		List<BuyHistory> buyList = mallService.selectBuyList(memberId);
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

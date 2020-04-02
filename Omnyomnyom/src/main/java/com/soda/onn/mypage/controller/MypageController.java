package com.soda.onn.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mypage.model.service.MypageService;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private MallService mallService;

	@Autowired
	private ChefService chefService;

	@Autowired
	private OnedayService onedayService;
	
	@GetMapping("/buyList")
	public void buyList(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("");
		List<BuyHistory> buyList = mallService.selectBuyList(memberId);
		log.debug("buyList={}",buyList);
		model.addAttribute("buyList", buyList);
	}
	
	@GetMapping("/chefRequest")
	public void chefRequest(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("");
		ChefRequest chefRequest = chefService.selectChefRequest(memberId);
		log.debug("chefRequest={}",chefRequest);
		model.addAttribute("chefRequest", chefRequest);
	}
	
	@GetMapping("/onedayList")
	public void onedayList(HttpSession session, 
						   Model model,
						   @RequestParam(value="cPage", defaultValue="1") int cPage) {
		int numPerPage = 15;
		String memberId = (String) session.getAttribute("");
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Reservation> reservationList = onedayService.selectReservationList(memberId,rowBounds);
		log.debug("reservationList={}",reservationList);
		model.addAttribute("reservationList", reservationList);
	}
	
	@GetMapping("/qnaMsg")
	public void qnaMsg() {
		
	}
	
	@GetMapping("/scrapList")
	public ModelAndView scrapList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String memberId = (String)session.getAttribute("memberLoggedIn");
		
		List<Scrap> scrapList = mypageService.selectScrapList(memberId);
		mav.setViewName("mypage/scrapList");
		mav.addObject("scrapList", scrapList);
		return mav;
	}
	
	@GetMapping("/onedayReservation")
	public ModelAndView onedayReservation(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}

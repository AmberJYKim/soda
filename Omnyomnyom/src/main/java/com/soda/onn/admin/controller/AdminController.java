package com.soda.onn.admin.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soda.onn.admin.model.service.AdminService;
import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private ChefService chefService;
	
	@Autowired
	private OnedayService onedayService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MallService mallService;
	
	
	private RowBounds rowBounds = null;
	
	@GetMapping("/chefList")
	public ModelAndView chefList() {
		ModelAndView mav = new ModelAndView();
		
		List<Chef> chefList = chefService.selectChefList();
		mav.addObject("chefList", chefList);
		mav.setViewName("admin/chefList");
		
		return mav;
	}
	
	@GetMapping("/chefRequestList")
	public ModelAndView chefRequestList() {
		ModelAndView mav = new ModelAndView();
		
		List<ChefRequest> chefRequestList = chefService.selectChefRequestList();
		mav.addObject("chefRequestList", chefRequestList);
		mav.setViewName("admin/chefRequestList");
		
		return mav;
	}

	@GetMapping("/reportList")
	public void reportList() {
		
	}
	
	@GetMapping("/reservationList")
	public ModelAndView reservationList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		int numPerPage = 15;
		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<Reservation> reservationList = onedayService.selectReservationList(null, rowBounds);
		mav.addObject("reservationList", reservationList);
		mav.setViewName("admin/reservationList");
		
		return mav;
	}
	
	@GetMapping("/ingredientList")
	public ModelAndView ingredientList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		int numPerPage = 15;
		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<IngredientMall> ingredientList = mallService.selectIngredientList(rowBounds);
		mav.addObject("ingredientList", ingredientList);
		mav.setViewName("admin/ingredientList");
		
		return mav;
	}

	@GetMapping("/mallManage")
	public ModelAndView mallManage(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		int numPerPage = 15;
		ModelAndView mav = new ModelAndView();

		//판매현황
		
		
		return mav;

	}
		
	@GetMapping("/memberList")
	public ModelAndView memberList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		int numPerPage = 15;
		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<Member> memberList = memberService.selectMemberList(rowBounds);
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/memberList");
		
		return mav;
	}
	
	@GetMapping("/onedayReviewList")
	public ModelAndView onedayReviewList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		int numPerPage = 15;
		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		List<OnedayReview> onedayReviewList = onedayService.selectOnedayReviewList(rowBounds);
		mav.addObject("onedayReview", onedayReviewList);
		mav.setViewName("admin/onedayReviewList");
		
		return mav;
	}
	
	
	
}

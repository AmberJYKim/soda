package com.soda.onn.admin.controller;

import java.util.List;

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
import com.soda.onn.oneday.model.service.OnedayService;
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
	
	
	
	@GetMapping("/chefList")
	public ModelAndView chefList() {
		ModelAndView mav = new ModelAndView();
		
//		List<Chef> chefList = chefService.selectChefList();
//		mav.addObject("chefList", chefList);
		mav.setViewName("admin/chefList");
		
		return mav;
	}
	
	@GetMapping("/chefReqList")
	public ModelAndView chefReqList() {
		ModelAndView mav = new ModelAndView();
		
//		List<ChefRequest> chefRequestList = chefService.selectChefRequestList();
//		mav.addObject("chefRequestList", chefRequestList);
		mav.setViewName("admin/chefRequestList");
		
		return mav;
	}

	@GetMapping("/reportList")
	public void reportList() {
		
	}
	
	@GetMapping("/reservationList")
	public ModelAndView reservationList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		final int numPerPage = 15;
		ModelAndView mav = new ModelAndView();
		
		List<Reservation> reservationList = onedayService.selectReservationList(cPage, numPerPage);
		mav.addObject("reservationList", reservationList);
		mav.setViewName("admin/reservationList");
		
		return mav;
	}
	
	@GetMapping("/ingredientList")
	public void ingredientList() {
		
	}

	@GetMapping("/mallManage")
	public void mallManage() {
		
	}

	@GetMapping("/memberList")
	public void memberList() {
		
	}
	@GetMapping("/reviewList")
	public void reviewList() {
		
	}
	
	
	
}

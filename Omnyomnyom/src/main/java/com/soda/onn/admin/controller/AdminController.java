package com.soda.onn.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.admin.model.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/chefList")
	public void chefList() {
		
	}
	
	@GetMapping("/chefReqList")
	public void chefReqList() {
		
	}

	@GetMapping("/reportList")
	public void reportList() {
		
	}
	
	@GetMapping("/reservationList")
	public void reservationList() {
		
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

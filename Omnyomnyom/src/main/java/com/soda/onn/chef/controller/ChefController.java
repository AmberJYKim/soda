package com.soda.onn.chef.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.soda.onn.chef.model.service.ChefService;

@Controller
public class ChefController {
	
	@Autowired
	private ChefService chefservice;
	
	@GetMapping("/chef/cheflist.do")
	public void cheflist() {
		
	}
	@GetMapping("/chef/chefpage.do")
	public void chefpage() {
		
	}
	
	
	
}

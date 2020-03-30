package com.soda.onn.chef.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.chef.model.service.ChefService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chef")
public class ChefController {

	@Autowired
	private ChefService chefService;
	
	
	@GetMapping("/cheflist")
	public void cheflist() {
//		return
	}
}

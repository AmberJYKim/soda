package com.soda.onn.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soda.onn.mall.model.service.MallService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall")
public class MallController {

	@Autowired
	private MallService mallService;

	@GetMapping("/shoppingBasket.do")
	public String shoppingBasketList() {
		return "mall/shoppingBasket";
	}
	
	@GetMapping("/selectedProductList.do")
	public String slectedProductList() {
		return "mall/selectedProductList";
	}
	
}

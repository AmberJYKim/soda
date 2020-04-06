package com.soda.onn.mall.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.service.MallServiceImpl;
import com.soda.onn.mall.model.vo.IngredientMall;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall")
public class MallController {

	@Autowired
	private MallService mallService;
	
//	뇸뇸몰 Main 이동 
	@GetMapping("/main")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("");
		return mav;
	}
	
	@GetMapping("/shoppingBasket")
	public String shoppingBasketList() {
		return "mall/shoppingBasket";
	}
	
	@GetMapping("/selectedProductList")
	public String slectedProductList() {
		return "mall/selectedProductList";
	}
	
// 뇸뇸몰 상품 상세페이지 이동 
	@GetMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam("ingredientNo") int ingredientNo) {
		ModelAndView mav = new ModelAndView();
		IngredientMall ingMall = mallService.selectIngMallOne(ingredientNo);
		mav.addObject("ingMall",ingMall);
		mav.setViewName("mall//productDetail");
		return mav;
	}
	@GetMapping(value = "/seachList/{subCtg}/ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchList(@PathVariable("subCtg") String subCtg){
		log.debug("접근");
		log.debug(subCtg);
		List<IngredientMall> list = mallService.selectIngredientList(subCtg);
		log.debug(list.toString());
		return new Gson().toJson(list);
	}
	
// 뇸뇸몰 상품 배송지정보 등록 페이지 이동 
	@GetMapping("/delivery")
	public String delivery() {
		return "mall/mallDelivery";
	}

// 뇸뇸몰 상품 결제정 등록 페이지 이동 
	@GetMapping("/paymentInfo")
	public String paymentInfo() {
		return "mall/mallPaymentInfo";
	}

// 뇸뇸몰 상품 결제정 등록 페이지 이동 
  	@GetMapping("/mallResult")
  	public String mallResult() {
		return "mall/mallResult";
  	}		
// 뇸뇸몰 상품등록 페이지 이동 
  	@GetMapping("/productInsert")
  	public String productInsert() {
  		return "mall/productInsert";
  	}
  	
}
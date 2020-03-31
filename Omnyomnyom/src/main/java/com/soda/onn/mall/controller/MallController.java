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
	
//	뇸뇸몰 Main 이동 
	@GetMapping("/productList.do")
	public String productList() {
		return "mall/mallMain";
	}
	
	
	@GetMapping("/shoppingBasket.do")
	public String shoppingBasketList() {
		return "mall/shoppingBasket";
	}
	
	@GetMapping("/selectedProductList.do")
	public String slectedProductList() {
		return "mall/selectedProductList";
	}
	
// 뇸뇸몰 상품 상세페이지 이동 
	@GetMapping("/productDetail.do")
	public String productDetail() {
		return "mall/productDetail";
	}
	
// 뇸뇸몰 상품 배송지정보 등록 페이이동 
		@GetMapping("/delivery.do")
		public String delivery() {
			return "mall/mallDelivery";
		}

// 뇸뇸몰 상품 결제정 등록 페이이동 
		 @GetMapping("/paymentInfo.do")
		 public String paymentInfo() {
				return "mall/mallPaymentInfo";
		 }

// 뇸뇸몰 상품 결제정 등록 페이이동 
		  @GetMapping("/mallResult.do")
		  public String mallResult() {
				return "mall/mallResult";
		  }		 
}

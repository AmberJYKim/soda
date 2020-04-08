package com.soda.onn.mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mall.model.vo.ShoppingBasket;
import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall")
public class MallController {

	@Autowired
	private MallService mallService;
	
//	뇸뇸몰 Main 이동 
	@GetMapping("/main")
	public void productList() {	}
	
	@GetMapping("/shoppingBasket")
	public String shoppingBasketList(HttpSession session, Model model) {
		
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		List<ShoppingBasket> sbList = mallService.selectSBList(memberId);
		
		model.addAttribute("sbList", sbList);
		
		return "mall/shoppingBasket";
	}
	
	@GetMapping("/selectedProductList")
	public String slectedProductList() {
		return "mall/selectedProductList";
	}
	@PostMapping(value = "/shopping/add", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String shoppingBasketAdd(@RequestParam("ingMallNo") int ingMallNo,
								  @RequestParam(value = "stock", defaultValue = "1") int stock,
								  HttpSession session) {
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		ShoppingBasket sb = new ShoppingBasket(ingMallNo, memberId, stock);
		int result = mallService.insertShoppingBasket(sb);
		log.debug("result--"+result);
		return "장바구니에 넣었습니다!";
	}
	
	
// 뇸뇸몰 상품 상세페이지 이동 
	@GetMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam("ingMallNo") int ingMallNo) {
		ModelAndView mav = new ModelAndView();
		IngredientMall ingMall = mallService.selectIngMallOne(ingMallNo);
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
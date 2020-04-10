package com.soda.onn.mall.controller;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.soda.onn.mall.model.vo.Cart;
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
	
	
//	장바구니 가져오기
	@GetMapping("/cart")
	public String cartList(HttpSession session, Model model) {
		
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		List<Cart> cartList = mallService.selectCartList(memberId);
		
		model.addAttribute("cartList", cartList);
		
		return "mall/Cart";
	}
//	????
	@GetMapping("/selectedProductList")
	public String selectedProductList() {
		return "mall/selectedProductList";
	}
	
	@DeleteMapping(value = "/cart/del/{ingMallNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public void cartDelete(@PathVariable("ingMallNo") int ingMallNo,
					       HttpSession session) {
		log.debug(""+ingMallNo);
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		Map<String, Object> map = new HashMap<String, Object>();
		Cart sb = new Cart();
		sb.setSbIngNo(ingMallNo);
		sb.setSbMemberId(memberId);
		int result = mallService.deleteCart(sb);
	}
	
//	장바구니 추가
	@PostMapping(value = "/cart/add", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String cartInsert(@RequestParam("ingMallNo") int ingMallNo,
							 @RequestParam(value = "stock", defaultValue = "1") int stock,
							 HttpSession session) {
		log.debug("추가 진입");
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		Cart sb = new Cart(ingMallNo, memberId, stock);
		int result = mallService.insertCart(sb);
		return "장바구니에 넣었습니다!";
	}
	
//	검색 결과
	@GetMapping("/search")
	public String search(@RequestParam("keyword") String keyword,
					   Model model) {
		log.debug(keyword);
		List<IngredientMall> list = mallService.selectIngMallSearch(keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("key",keyword);
		
		return "mall/searchResult";
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
	
	@GetMapping(value = "/seachList/ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchList(String subCtg){
		log.debug("접근");
		log.debug(subCtg);
		List<IngredientMall> list = mallService.selectIngredientList(subCtg);
		log.debug(list.toString());
		return new Gson().toJson(list);
	}
	
	@GetMapping("")
	public ModelAndView CheckOut(@RequestParam("items") List<Integer> ingredientNoList,
								 @RequestParam("stock") List<Integer> stockList) {
		ModelAndView mav = new ModelAndView();
		
		List<IngredientMall> ingMallList = mallService.selectCheckOutIng(ingredientNoList);
		
		mav.addObject("list", ingMallList);
		mav.setViewName("");
		return mav;
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
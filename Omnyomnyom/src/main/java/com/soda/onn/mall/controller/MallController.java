package com.soda.onn.mall.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mortbay.log.Log;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.Cart;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall")
@SessionAttributes({"paymentList","deliveryInfo"})
public class MallController {

	@Autowired
	private MallService mallService;
	
//	뇸뇸몰 Main 이동 
	@GetMapping("/main")
	public void main() {}
	
	
//	장바구니 가져오기
	@GetMapping("/cart")
	public String cartList(HttpSession session, Model model) {
		
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		List<Cart> cartList = mallService.selectCartList(memberId);
		
		model.addAttribute("cartList", cartList);
		
		return "mall/Cart";
	}
	
//	구매페이지로 이동
	@GetMapping(value = "/selectedIngMallList.ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectedIngMallList(@RequestParam("buyList") String buyList,
									  Model model) {
		List<Map<String,String>> list = new Gson().fromJson(buyList, List.class);
		List<IngredientMall> paymentList = mallService.selectIngMallList(list);
		model.addAttribute("paymentList", paymentList);
		return "/mall/selectedIngMallList";
	}
	
	@GetMapping("/selectedIngMallList")
	public void selectedIngMallList(Model model) {}
	
	@DeleteMapping(value = "/cart/del/{ingMallNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public void cartDelete(@PathVariable("ingMallNo") int ingMallNo,
					       HttpSession session) {
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		Map<String, Object> map = new HashMap<String, Object>();
		Cart cart = new Cart();
		cart.setSbIngNo(ingMallNo);
		cart.setSbMemberId(memberId);
		int result = mallService.deleteCart(cart);
	}
	
//	장바구니 추가
	@PostMapping(value = "/cart/add", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String cartInsert(@RequestParam("ingMallNo") int ingMallNo,
							 @RequestParam(value = "stock", defaultValue = "1") int stock,
							 HttpSession session) {
		String memberId = ((Member)session.getAttribute("memberLoggedIn")).getMemberId();
		
		Cart cart = new Cart(ingMallNo, memberId, stock);
		int result = mallService.insertCart(cart);
		return "장바구니에 넣었습니다!";
	}
	
//	검색 결과창
	@GetMapping("/search")
	public String search(@RequestParam("keyword") String keyword,
					   Model model) {
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

//	검색결과 Ajax 응답
	@GetMapping(value = "/seachList.ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchList(String subCtg){
		List<IngredientMall> list = mallService.selectIngredientList(subCtg);
		return new Gson().toJson(list);
	}
	
//	구매정보 확인
	@GetMapping("/checkOut")
	public ModelAndView CheckOut(@RequestParam("items") List<Integer> ingredientNoList,
								 @RequestParam("stock") List<Integer> stockList) {
		
		ModelAndView mav = new ModelAndView();
		
		List<IngredientMall> ingMallList = mallService.selectCheckOutIng(ingredientNoList);
		
		//재고보다 많은 구매를 요청할 경우 해당 상품의 구매량을 0으로 바꿔 구매할 수 없게 유도
		for (int i = 0; i < ingMallList.size(); i++)
			if(stockList.get(i) > ingMallList.get(i).getStock())
				stockList.set(i, 0);
			
		mav.addObject("ingMallList", ingMallList);
		mav.setViewName("mall/paymentInfo");
		return mav;
	}
	@GetMapping("/paymentInfo")
	public void paymentInfo() {
		
	}
	
  	@GetMapping("/delivery")
  	public void delivery() {}
  	
// 뇸뇸몰 상품등록 페이지 이동 
  	@GetMapping("/productInsert")
  	public String productInsert() {
  		return "mall/productInsert";
  	}
  	
  
  	
}
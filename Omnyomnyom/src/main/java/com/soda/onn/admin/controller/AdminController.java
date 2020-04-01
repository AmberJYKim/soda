package com.soda.onn.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soda.onn.admin.model.service.AdminService;
import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.common.base.PageBar;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.OnedayReview;
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

	@Autowired
	private MemberService memberService;

	@Autowired
	private MallService mallService;
	
	final int NUMPERPAGE = 15;
	final int PAGEBARSIZE = 10;

	
	private RowBounds rowBounds = null;
	
	//셰프목록
	@GetMapping("/chefList")
	public ModelAndView chefList() {
		ModelAndView mav = new ModelAndView();
		
		List<Chef> chefList = chefService.selectChefList();
		mav.addObject("chefList", chefList);
		mav.setViewName("admin/chefList");
		
		return mav;
	}
	
	//셰프신청목록
	@GetMapping("/chefRequestList")
	public ModelAndView chefRequestList() {
		ModelAndView mav = new ModelAndView();
		
		List<ChefRequest> chefRequestList = chefService.selectChefRequestList(); 
		mav.addObject("chefRequestList", chefRequestList);
		mav.setViewName("admin/chefRequestList");
		
		return mav;
	}

	//신고목록
	@GetMapping("/reportList")
	public void reportList() {
		
	}
	
	
	//예약현황목록
	@GetMapping("/reservationList")
	public ModelAndView reservationList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		log.debug("미완성");

		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		
		List<Reservation> reservationList = onedayService.selectReservationList(null, rowBounds);
		mav.addObject("reservationList", reservationList);
		mav.setViewName("admin/reservationList");
		
		return mav;
	}
	
	//재료목록
	@GetMapping("/ingredientList")
	public ModelAndView ingredientList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		ModelAndView mav = new ModelAndView();
		log.debug("미완성");

		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		
		List<IngredientMall> ingredientList = mallService.selectIngredientList(rowBounds);
		mav.addObject("ingredientList", ingredientList);
		mav.setViewName("admin/ingredientList");
		
		return mav;
	}

	//판매번호로그
	@GetMapping("/mallManage")
	public ModelAndView mallManage(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		ModelAndView mav = new ModelAndView();
		log.debug("미완성");
		//판매현황
		
		
		return mav;

	}
		
	//회원목록
	@GetMapping("/memberList")
	public ModelAndView memberList(@RequestParam(value="cPage", defaultValue="1") int cPage,
								   HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int pageStart = ((cPage - 1)/PAGEBARSIZE) * PAGEBARSIZE +1;
		int pageEnd = pageStart+PAGEBARSIZE-1;
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		int totalCount = memberService.selectMemberListCnt();
		int totalPage =  (int)Math.ceil((double)totalCount/NUMPERPAGE);
		String url = request.getRequestURL().toString();
		String paging = PageBar.Paging(url, cPage, pageStart, pageEnd, totalPage);
		
		List<Member> memberList = memberService.selectMemberList(rowBounds);
		
		mav.addObject("paging", paging);
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/memberList");
		return mav;
	}
	
	//후기목록
	@GetMapping("/onedayReviewList")
	public ModelAndView onedayReviewList(@RequestParam(value="cPage", defaultValue="1") int cPage) {
		log.debug("미완성");

		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		
		List<OnedayReview> onedayReviewList = onedayService.selectOnedayReviewList(rowBounds);
		mav.addObject("onedayReview", onedayReviewList);
		mav.setViewName("admin/onedayReviewList");
		
		return mav;
	}
	
	
	
}

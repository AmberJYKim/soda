package com.soda.onn.mypage.controller;

import java.nio.channels.SeekableByteChannel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.common.base.PageBar;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.mypage.model.service.MypageService;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private MallService mallService;

	@Autowired
	private ChefService chefService;

	@Autowired
	private OnedayService onedayService;
	
	@Autowired
	private MemberService memberService;
	
	final int NUMPERPAGE = 15;
	final int PAGEBARSIZE = 10;

	
	private RowBounds rowBounds = null;
	
	@GetMapping("/main")
	public void mypageMain() {
		
	}
		
	@GetMapping("/updateinfo")
	public String updateInfo(HttpSession session,
							 RedirectAttributes redirectAttributes,
							 Member member) {

		if(session.getAttribute("memberLoggedIn") != null) {
			
			Member loginUser = (Member) session.getAttribute("memberLoggedIn");
			member.setMemberId(loginUser.getMemberId());
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("member", member);
			
			int updateInfo = memberService.updateInfo(params);			
			session.setAttribute("memberLoggedIn", memberService.selectOne(member.getMemberId()));
					
			redirectAttributes.addFlashAttribute("msg", updateInfo>0?"수정 성공!":"수정 실패!");	
		}
		
		return "redirect:/mypage/main";
	}
	
	
	@GetMapping("/buyList")
	public void buyList(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("");
		List<BuyHistory> buyList = mallService.selectBuyList(memberId);
		log.debug("buyList={}",buyList);
		model.addAttribute("buyList", buyList);
	}
	
	@GetMapping("/chefRequest")
	public void chefRequest(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("");
		ChefRequest chefRequest = chefService.selectChefRequest(memberId);
		log.debug("chefRequest={}",chefRequest);
		model.addAttribute("chefRequest", chefRequest);
	}
	
	@GetMapping("/onedayList")
	public void onedayList(HttpSession session, 
						   Model model,
						   @RequestParam(value="cPage", defaultValue="1") int cPage) {
		
		System.out.println("onedayList 메소드입니다");
		System.out.println("세션 속성 = "+session.getAttribute("memberLoggedIn"));
		
		int numPerPage = 15;
		
		System.out.println("-------------------------------------------------");
		Member member = (Member)session.getAttribute("memberLoggedIn");
		
		System.out.println("session객체를 member객체에 대입 = "+member);
		String memberId = member.getMemberId();
		
		System.out.println("String에 member객체 id값만 대입 = "+memberId);
		System.out.println("-------------------------------------------------");

		
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Reservation> reservationList = onedayService.selectReservationList(memberId,rowBounds);
		log.debug("reservationList={}",reservationList);
		model.addAttribute("reservationList", reservationList);
	}
	
	@GetMapping("/qnaMsg")
	public void qnaMsg() {
		
	}
	
	@GetMapping("/scrapList")
	public ModelAndView scrapList(HttpSession session,
								 @RequestParam(value="cPage", defaultValue="1") int cPage, 
								 HttpServletRequest request) {
		
		log.debug("scrapList = {}", session);
		
		Member member = (Member)session.getAttribute("memberLoggedIn");
		String memberId = member.getMemberId();
		
		
		
		ModelAndView mav = new ModelAndView();
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		int pageStart = ((cPage - 1)/PAGEBARSIZE) * PAGEBARSIZE +1;
		int pageEnd = pageStart+PAGEBARSIZE-1;
		int totalCount = chefService.selectChefRequestListCnt();
		int totalPage =  (int)Math.ceil((double)totalCount/NUMPERPAGE);
		String url = request.getRequestURL().toString();
		String paging = PageBar.Paging(url, cPage, pageStart, pageEnd, totalPage);
		
		List<Scrap> list = mypageService.selectScrapList(memberId, rowBounds);
		
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.setViewName("mypage/scrapList");
		
		return mav;
	}
	
	@GetMapping("/onedayReservation")
	public ModelAndView onedayReservation(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("/deleteScrap")
	public String deleteScrap(@RequestParam("recipeNo") int recipeNo,
							  RedirectAttributes redirectAttributes) {
		
		int result = mypageService.deleteScrap(recipeNo);
		redirectAttributes.addFlashAttribute("msg", result>0?"스크랩이 삭제 됐습니다.":"삭제 할 스크랩이 없습니다.");
		
		return "redirect:/mypage/scrapList";
	}
	
	@GetMapping("updateScrap")
	public String updateScrap(Scrap scrap,
							  HttpSession session,
							  RedirectAttributes redirectAttributes) {
		System.out.println(session.getAttribute("memberLoggedIn"));
		System.out.println("mypageController@updateScrap 메소드 scrap객체 = "+scrap);
		Member scrapId = (Member)session.getAttribute("memberLoggedIn");
		System.out.println(scrapId.getMemberId());
		System.out.println("=============================");
		scrap.setScrapId(scrapId.getMemberId());
		System.out.println(scrap);
		
		int result = mypageService.updateScrap(scrap);
		System.out.println("mypageController@updateScrap 결과값  = "+result);
				
		redirectAttributes.addFlashAttribute("msg", result>0?"스크랩 메모 수정 성공.":"스크랩 메모 수정 실패.");
		
		return "redirect:/mypage/scrapList";
	}
	
	@GetMapping("/directMsg")
	public void directMsg() {
		
	}
	
}

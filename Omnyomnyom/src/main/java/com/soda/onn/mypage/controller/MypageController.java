package com.soda.onn.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.mall.model.service.MallService;
import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.mypage.model.service.MypageService;
import com.soda.onn.mypage.model.vo.DingDongList;
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
		int numPerPage = 15;
		String memberId = (String) session.getAttribute("");
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Reservation> reservationList = onedayService.selectReservationList(memberId,rowBounds);
		log.debug("reservationList={}",reservationList);
		model.addAttribute("reservationList", reservationList);
	}
	
	@GetMapping("/qnaMsg")
	public void qnaMsg() {
		
	}
	
	@GetMapping("/scrapList")
	public ModelAndView scrapList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String memberId = (String)session.getAttribute("memberLoggedIn");
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		int pageStart = ((cPage - 1)/PAGEBARSIZE) * PAGEBARSIZE +1;
		int pageEnd = pageStart+PAGEBARSIZE-1;
		int totalCount = chefService.selectChefRequestListCnt();
		int totalPage =  (int)Math.ceil((double)totalCount/NUMPERPAGE);
		String url = request.getRequestURL().toString();
		String paging = PageBar.Paging(url, cPage, pageStart, pageEnd, totalPage);
		
		List<Scrap> list = mypageService.selectScrapList(memberId, rowBounds);
		System.out.println("여기는 스크랩목록 = " + list);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
	  mav.addObject("scrapList", scrapList);
    mav.setViewName("mypage/scrapList");
		return mav;
	}
	
	@GetMapping("/onedayReservation")
	public ModelAndView onedayReservation(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//스크랩 삭제
	@GetMapping("/deleteScrap")
	public String deleteScrap(@RequestParam("recipeNo") int recipeNo,
							  RedirectAttributes redirectAttributes) {
		
		int result = mypageService.deleteScrap(recipeNo);
		redirectAttributes.addFlashAttribute("msg", result>0?"스크랩이 삭제 됐습니다.":"삭제 할 스크랩이 없습니다.");
		
		return "redirect:/mypage/scrapList";
	}
	
	//스크랩 메모 수정
	@GetMapping("updateScrap")
	public String updateScrap(Scrap scrap,
							  HttpSession session,
							  RedirectAttributes redirectAttributes) {

		Member scrapId = (Member)session.getAttribute("memberLoggedIn");
		log.debug("updateScrap scrapId.getMemberId()={}", scrapId.getMemberId());

		scrap.setScrapId(scrapId.getMemberId());
		log.debug("updateScrap scrap={}", scrap);
		
		int result = mypageService.updateScrap(scrap);
		log.debug("updateScrap result={}", result);
				
		redirectAttributes.addFlashAttribute("msg", result>0?"스크랩 메모 수정 성공.":"스크랩 메모 수정 실패.");
		
		return "redirect:/mypage/scrapList";
	}
	
	//알림 목록
	@GetMapping("/dingdongList")
	public ModelAndView dingdongList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		Member userId = (Member)session.getAttribute("memberLoggedIn");
		String memberId = userId.getMemberId();
		System.out.println("이곳은 알림목록 유저아이디 = "+memberId);
		
		List<DingDongList> list = mypageService.selectDingList(memberId);
		System.out.println("여기는 알림목록  = "+list);
		
		mav.addObject("list", list);
		mav.setViewName("/mypage/dingdongList");
		
		return mav;
	}
	
	@GetMapping("/directMsg")
	public void directMsg() {
		
	}
	
}

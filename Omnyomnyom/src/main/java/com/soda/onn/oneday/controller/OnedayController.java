package com.soda.onn.oneday.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.common.util.Utils;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.Attachment;
import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayTime;
import com.soda.onn.oneday.model.vo.Reservation;
import com.soda.onn.oneday.model.vo.ReservationRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/oneday")
public class OnedayController {

	@Autowired
	private OnedayService onedayService;
	@Autowired
	private ChefService chefservice;

	
//	원데이 클래스 메인뷰로 이동 
	@GetMapping("/oneday")
	public void oneday() {
		
		log.debug("@oneday @ onedayController = 원데이클래스 메인페이지로 이동합니다!" );
	}
//	원데이 클래스 생성뷰로 이동
	@GetMapping("/class_insert")
	public void classinsert() {
		
		log.debug("oneday_insert @ onedayController = 원데이클래스 등록 페이지로 이동합니다!");
	}
	
//	클래스 관리 페이지로 이동
	@GetMapping("/class_manager")
	@ResponseBody
	public ModelAndView classManager(ModelAndView mav, HttpSession session) {
		log.debug("oneday_manager @ onedayController = 원데이클래스 관리페이지로 이동합니다!");
		String MemberNickName = ((Member) session.getAttribute("memberLoggedIn")).getMemberNick();
		Chef chef = chefservice.chefSelectOne(MemberNickName);
		String chefId = chef.getChefId();
		List<Oneday> onedayList = chefservice.onedaySelectAll(chefId);
		log.debug("onedayList = {}",onedayList);
		
		mav.addObject("onedayList",onedayList);
		return mav;
	}
	
//	원데이클래스 수정페이지로 이동
	@PostMapping("/oneday_update")
	public ModelAndView classUpdateView(@ModelAttribute ModelAndView mav,
									RedirectAttributes redirectAttributes,
									HttpSession session,
									@RequestParam(value="onedayclassNo") int onedayclassNo) {
		log.debug("oneday_update @ controller = 원데이클래스 수정페이지로 이동합니다.");
		log.debug("update@onedayclassNo = "+onedayclassNo);
		String memberId = ((Member) session.getAttribute("memberLoggedIn")).getMemberId();
		
		Oneday oneday = onedayService.selectOne(onedayclassNo);
		
		log.debug("oneday@controller(update)/selectOne={}", oneday);
		
		
		List<OnedayTime> list = onedayService.selectTimeList(onedayclassNo);
		
		
		log.debug("update@list={}", list);
		
		mav.addObject("memberId",memberId);
		mav.addObject("list", list);
		mav.addObject("oneday", oneday);
		
		return mav;
	}
//	원데이클래스 수정실행
	@PostMapping("/class_update")
	public ModelAndView classUpdate(@ModelAttribute Oneday oneday,
								   RedirectAttributes redirectAttributes,
								   @RequestParam(value="onedayTimeM", defaultValue = "0")int onedayTimeM,
								   @RequestParam(value="onedayImgFile", required = false) MultipartFile onedayImg,
								   @RequestParam(value="classdate") String[] onedayTimeList,
								   HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		log.debug("class_update @ controller = 원데이클래스 수정절차를 실행합니다.");
		
		
		List<Attachment> addImgList = new ArrayList<>();
		if(!onedayImg.isEmpty()) {
			String originalFileName = onedayImg.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originalFileName);			
			
			//파일 이동시킴
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/onedayclass");
			
			try {
				
				onedayImg.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//실제 데이터 -> db 저장
			Attachment addImg = new Attachment();
			addImg.setOriginalFileName(originalFileName);
			addImg.setRenamedFileName(renamedFileName);
			log.debug("classupdate @ addImg={}",addImg);
			addImgList.add(addImg);
			
			oneday.setOnedayImg(renamedFileName);
		}
		//이미지 확인
		log.debug("classupdate @ addImgList={}", addImgList);
		
		//String[]의 
		
		
		List<String> otiList = new ArrayList<String>(Arrays.asList(onedayTimeList));
	
		if(otiList != null) {
			for (int i=0; i<otiList.size(); i++) {
				System.out.println("classupdate @ otiList = "+ otiList.get(i));
			}
		}
		
		System.out.println("classupdate @ otiList = "+otiList);
		
		int result = onedayService.classUpdate(oneday, otiList);
		
		mav.addObject("onedayTimeM", onedayTimeM);
		log.debug("onedayclassNo="+ oneday.getOnedayclassNo());
		mav.setViewName("redirect:/oneday/oneday_detail?onedayclassNo="+oneday.getOnedayclassNo());
		return mav;
		
	} 

	
//  원데이클래스 삭제
	@PostMapping("/class_delete")
	public String classDelete(
								RedirectAttributes redirectAttributes,
								@RequestParam(value ="onedayclassNo")int onedayclassNo) {
		
		int result = onedayService.deleteOneday(onedayclassNo);
		
		String msg ="";
		
		redirectAttributes.addFlashAttribute("msg",result>0?"원데이클래스를 정상적으로삭제하였습니다.":"원데이클래스를 삭제하기 못하였습니다.");
		
		return "redirect:/oneday/class_manager";
		
	}
	
//	클래스 검색 결과뷰 로 이동 
	@GetMapping("/oneday_search")
	public void search() {
		log.debug("oneday_search @ ondayController = 원데이클래스 검색!");
	}
	
//	클래스 검색
	@PostMapping("/oneday_search")
	public ModelAndView search(@ModelAttribute ModelAndView mav,
						@RequestParam(value = "detailedAddr")String detailedAddr,
						@RequestParam(value = "onedayName")String onedayName,
						@RequestParam(value = "onedayTimeDate") String onedayTimeDate) {
		
		
		System.out.println("일정 =" + onedayTimeDate);
		System.out.println("상세주소 = "+ detailedAddr);
		System.out.println("클래스 이름 = " + onedayName);
		
		Map<String, String> sec = new HashMap<>();
	
		
		sec.put("detailedAddr", detailedAddr);
		sec.put("onedayName", onedayName);
		sec.put("onedayTimeDate", onedayTimeDate);
		
		List<Oneday> list = onedayService.selectDateList(sec);
		mav.addObject("list", list);
		System.out.println("[["+list+"]]");
		
		return mav;
	}
	
//	원데이 클래스 디테일뷰 로 이동 
	@GetMapping("/oneday_detail")
	public void detail(@RequestParam(value="onedayclassNo") int onedayclassNo, Model model) {
		
		log.debug("oneday_detail @클래스 no = "+onedayclassNo);
		
		Oneday oneday = onedayService.selectOne(onedayclassNo);
		log.debug("controller@oneday/selectOne={}", oneday);
		
		
		List<OnedayTime> list = onedayService.selectTimeList(onedayclassNo);
		
		
		log.debug("list={}", list);

		
		model.addAttribute("oneday", oneday);
		model.addAttribute("list", list);
	}

	
//	원데이 클래스 예약뷰로 이동 
	@PostMapping("/oneday_reservation")
	public ModelAndView reservation(@ModelAttribute ModelAndView mav,
									@ModelAttribute Reservation reservation,
									@ModelAttribute Oneday oneday,
									@ModelAttribute ReservationRequest reservationrequest,
									@RequestParam(value="onedayclassNo") int onedayclassNo,
									@RequestParam(value="onedayTimeNo" ) int onedayTimeNo,
									HttpSession session
									) {
		log.debug("클래스 넘버={}", onedayclassNo);
		log.debug("타임 넘버={}", onedayclassNo);
		
		String memberId = ((Member) session.getAttribute("memberLoggedIn")).getMemberId();
			
//		reservation.setReserMemberId(memberId);
		
		reservationrequest.setReserMemberId(memberId);
		reservationrequest.setOnedayclassNo(onedayclassNo);
		reservationrequest.setOnedaytimeNo(onedayTimeNo);
		
		System.out.println(reservationrequest);
		System.out.println(reservation);
		session.setAttribute("reservationrequest", reservationrequest);
		
//		int result = onedayService.insertReservation(reservationrequest);
		mav.addObject("Oneday", oneday);
		mav.addObject("reservationrequest", reservationrequest);
		
		return mav;
	}
	
	
	
	
//	원데이 클래스 예약 동의뷰로 이동 
	@GetMapping("/oneday_agree")
	public void agree() {
		
		
	}
//	원데이 클래스 예약 결제뷰로 이동 
	@GetMapping("/oneday_pay")
	public ModelAndView pay(@ModelAttribute ModelAndView mav,HttpSession session) {
		
		ReservationRequest reservationrequest = (ReservationRequest) session.getAttribute("reservationrequest");
		
		mav.addObject("reservationrequest", reservationrequest);
		
		return mav;
		
	}
//	원데이 클래스 예약완료 뷰로 이동 
	@PostMapping("/result.do")
	public String result() {
		return "oneday/oneday_result";
		
	}
	
	
	//원데이클래스 Insert 하기
	@PostMapping("/insert.do")
	public ModelAndView insert(@ModelAttribute Oneday oneday, 
											   ModelAndView mav,
											   RedirectAttributes redirectAttributes,
							   @RequestParam(value="onedayTimeM", defaultValue = "0")int onedayTimeM,
							   @RequestParam(value="onedayImgFile", required = false) MultipartFile onedayImg,
							   @RequestParam(value="classdate") String[] onedayTimeList,
							   HttpSession session,
							   HttpServletRequest request) {
		log.debug("원데이클래스 등록 절차를 시작합니다!");
		String memberId = ((Member) session.getAttribute("memberLoggedIn")).getMemberId(); 
		String memberNickName = ((Member) session.getAttribute("memberLoggedIn")).getMemberNick();
		
		//파일 처리
		List<Attachment> addImgList = new ArrayList<>();
		if(!onedayImg.isEmpty()) {
			String originalFileName = onedayImg.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originalFileName);			
			
			//파일 이동시킴
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/onedayclass");
			
			try {
				
				onedayImg.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//실제 데이터 -> db 저장
			Attachment addImg = new Attachment();
			addImg.setOriginalFileName(originalFileName);
			addImg.setRenamedFileName(renamedFileName);
			log.debug("addImg={}",addImg);
			addImgList.add(addImg);
			
			oneday.setOnedayImg(renamedFileName);
		}
		//이미지 확인
		log.debug("addImgList={}", addImgList);
		
		//String[]의 
		
		

		List<String> otiList = new ArrayList<String>(Arrays.asList(onedayTimeList));
		
		if(otiList != null) {
			for (int i=0; i<otiList.size(); i++) {
				System.out.println(otiList.get(i));
			}
		}
		
		System.out.println(otiList);
		
		
		
		int result = onedayService.insertOneday(oneday, otiList);
//		원데이클래스 개설 
		log.debug("oneday={}" + oneday);
		
		
		String msg = "";
		Log.debug("result+"+result);
		redirectAttributes.addFlashAttribute("msg", result>0?"원데이 클래스 등록완료!":"원데이클래스 등록실패!");
		
		//requestParam으로 value값, defaultValue 값 => 변수 선언해줌
		
		mav.addObject("memberNickName", memberNickName);
		mav.addObject("memberId", memberId);
		mav.addObject("onedayTimeM", onedayTimeM);
		mav.setViewName("redirect:/");
		
		return mav;
	}
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

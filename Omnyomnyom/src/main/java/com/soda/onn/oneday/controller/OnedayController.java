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
import javax.websocket.Session;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
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
	@GetMapping("/class_manager.do")
	public void classManager() {
		
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
		
		log.debug("클래스 no = "+onedayclassNo);
		
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
									@ModelAttribute ReservationRequest reservationrequest,
									HttpSession session, RedirectAttributes redirectAttributes,
									@RequestParam(value="onedayclassNo") int onedayclassNo,
									@RequestParam(value="onedayTimeNo" ) int onedayTimeNo
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
		
		mav.addObject("reservationrequest", reservationrequest);
		mav.setViewName("/oneday/oneday_reservation");
		
		return mav;
	}
	
//	원데이 클래스 예약
//	@PostMapping("/oneday_reservation")
//	public String reservation() {
//		
//	}
	
	
	
	
//	원데이 클래스 예약 동의뷰로 이동 
	@GetMapping("/agree.do")
	public String agree() {
		return "oneday/oneday_agree";
		
	}
//	원데이 클래스 예약 결제뷰로 이동 
	@GetMapping("/pay.do")
	public String pay() {
		return "oneday/oneday_pay";
		
	}
//	원데이 클래스 예약완료 뷰로 이동 
	@PostMapping("/result.do")
	public String result() {
		return "oneday/oneday_result";
		
	}
	
	
	//원데이클래스 개설 뷰 제공
	/*
	 * @GetMapping("/class_insert.do") public String insert(HttpSession session,
	 * RedirectAttributes redirectAttributes) {
	 * 
	 * Member member = (Member)session.getAttribute("멤버 로그드 뭐시기");
	 * 
	 * if(member != null && "C".equals(member.getMemberRoll())) return
	 * "oneday/class_insert";
	 * 
	 * redirectAttributes.addFlashAttribute("msg", "셰프만 만들 수 있어요!"); return
	 * "redirect:/"; }
	 */
	
	//원데이클래스 Insert 하기
	@PostMapping("/insert.do")
	public ModelAndView insert(@ModelAttribute Oneday oneday, 
											   ModelAndView mav,
											   RedirectAttributes redirectAttributes,
							   @RequestParam(value="onedayTimeM", defaultValue = "0")int onedayTimeM,
							   @RequestParam(value="onedayImgFile", required = false) MultipartFile onedayImg,
							   @RequestParam(value="classdate") String[] onedayTimeList,
							   HttpServletRequest request) {
		log.debug("원데이클래스 등록 절차를 시작합니다!");
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
		
		mav.addObject("onedayTimeM", onedayTimeM);
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	/*
	 * @GetMapping("/oneday_search") public ModelAndView nomalSearch(@ModelAttribute
	 * Oneday oneday, ModelAndView mav, RedirectAttributes redirectAttributes) {
	 * 
	 * 
	 * return mav; }
	 */
	
	
	//	원데이클래스 수정 뷰 제공
	@PutMapping("/update")
	public String update(@RequestParam("onedayclassNo") int onedayclassNo) {
		Oneday oneday = onedayService.selectOne(onedayclassNo);
		return "";
	}
	
//	원데이클래스 삭제
	@DeleteMapping("/delete")
	public String delete(@RequestParam("onedayclassNo") int onedayclassNo) {
		
		//글 작성자 or 관리자 검사
		
		//클래스 삭제
		int result = onedayService.deleteOneday(onedayclassNo);
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

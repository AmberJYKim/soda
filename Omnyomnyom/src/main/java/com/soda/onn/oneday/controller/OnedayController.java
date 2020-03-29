package com.soda.onn.oneday.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soda.onn.member.model.vo.Member;
import com.soda.onn.oneday.model.service.OnedayService;
import com.soda.onn.oneday.model.vo.Oneday;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/oneday")
public class OnedayController {

	@Autowired
	private OnedayService onedayService;
	
	
	//원데이클래스 개설 뷰 제공
	@GetMapping("/insert")
	public String insert(HttpSession session,
			 RedirectAttributes redirectAttributes) {

		Member member = (Member)session.getAttribute("멤버 로그드 뭐시기");
		
		if(member != null && "C".equals(member.getMemberRoll())) 
			return "클래스 개설 jsp로 갑시다";
		
		redirectAttributes.addFlashAttribute("msg", "셰프만 만들 수 있어요!");
		return "redirect:/";
	}

	
	//원데이클래스 Insert 하기
	@PostMapping("/insert")
	public ModelAndView insert(Oneday oneday) {
		
		
		int result = onedayService.insertOneday(oneday);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("완료시 처리해줄 주소");
		
		return mav;
	}
	
//	원데이클래스 수정 뷰 제공
	@PutMapping("/update")
	public String update(@RequestParam("onedayNo") int onedayNo) {
		Oneday oneday = onedayService.selectOne(onedayNo);
		return "";
	}
	
//	원데이클래스 삭제
	@DeleteMapping("/delete")
	public String delete(@RequestParam("onedayNo") int onedayNo) {
		
		//글 작성자 or 관리자 검사
		
		//클래스 삭제
		int result = onedayService.deleteOneday(onedayNo);
		
		return "";
	}
	
	//
	
	
	//
	
	//
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

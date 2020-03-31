package com.soda.onn.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	//로그인요청
	@GetMapping("/login")
	public String login(@RequestParam("loginId") String memberId,
	    			    @RequestParam("loginPassword") String memberPwd,
	    			    Model model,
	    			    RedirectAttributes redirectAttributes,
	    			    HttpServletRequest request){
		
		Member member = memberService.selectOne(memberId);
		
		if(member != null) {
			
			if(bcrypt.matches(memberPwd, member.getMemberPwd()))
				model.addAttribute("memberLoggedIn", member);
			
			else 
				redirectAttributes.addAttribute("msg", "아이디와 비밀번호를 다시 한번 확인해주세요");
			
		}else {
			redirectAttributes.addAttribute("msg", "아이디와 비밀번호를 다시 한번 확인해주세요");
		}
		
		return request.getHeader("referer");
	}

	
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus,
						 @ModelAttribute("memberLoggedIn") Member member) {
		log.debug("_______________로그아웃 처리");
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
	
	//회원가입용 AJAX 메소드
	@GetMapping("/enroll.do")
	@ResponseBody
	public Boolean enroll(@RequestParam("") String col,
					   @RequestParam("") String value) {
		
		Boolean chkBool = true;
		Map<String, String> map = new HashMap<String, String>();
		map.put(col, value);
		Member member = memberService.selectMember(map);
		if(member != null)
			chkBool = false;
			
		return chkBool;
	}	
	
	//회원가입요청
	@PostMapping("/enroll")
	public String enroll(Member member,
						 RedirectAttributes redirectAttributes) {
		
		ModelAndView mav = new ModelAndView();
		log.debug("member={}",member);
		String memberPwd = member.getMemberPwd();

		String bcryptPwd = bcrypt.encode(memberPwd);
		member.setMemberPwd(bcryptPwd);

		//회원추가
		int result = memberService.insertMember(member);
		
		String msg = "";
		if(result>0) msg = "회원가입에 성공하셨습니다!";
		else msg = "회원가입에 실패하셨습니다.";
		
		redirectAttributes.addFlashAttribute("msg", msg);
		//홈페이지로 보내주기
		return "redirect:/";
	}

	

}

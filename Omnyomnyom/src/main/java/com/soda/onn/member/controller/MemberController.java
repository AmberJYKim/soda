package com.soda.onn.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soda.onn.member.model.service.MemberService;
import com.soda.onn.member.model.vo.Member;
import com.sun.org.apache.xml.internal.resolver.helpers.Debug;

import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.i;

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
	    			    HttpSession session,
	    			    RedirectAttributes redirectAttributes){
		log.debug("로그인 접근");
		Member member = memberService.selectOne(memberId);
		log.debug("memberId={}",memberId);
		
		if(member != null) {
			log.debug("회원객체 존재");
			
			if(bcrypt.matches(memberPwd, member.getMemberPwd())) {
				session.setAttribute("memberLoggedIn", member);
				log.debug(member.getMemberNick()+"("+member.getMemberId()+")님이 로그인을 했습니다.");
			}else {
				log.debug("비밀번호 틀림");
				redirectAttributes.addFlashAttribute("msg", "입력한 아이디 또는 비밀번호가 일치하지 않습니다.");
			}
			
		}else {
			log.debug("아이디 틀림");
			redirectAttributes.addFlashAttribute("msg", "입력한 아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		log.info("현재 로그인 실패시 addFlashAttribute 작동하지 않음.");
		
		return "redirect:/";
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

	
//	@GetMapping("/{memberNick}/checkMember")
	@GetMapping("/checkMember/{key}/{value}")
	@ResponseBody
	public Map<String, String> checkId2(@PathVariable("key") String key, 
										@PathVariable("value") String value,
			Model model) {
//		log.debug("memberId={}", memberId);
//		log.debug("memberId={}", key, value);
		
		System.out.println("key = " + key);
		System.out.println("value = " + value);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put(key, value);
		
		log.debug("회원가입 Ajax 진입");
		Member checkMember = memberService.selectMember(map);
			
//		System.out.println("checkMember@controller = " + checkMember);
		String isUsable = "";
		if(checkMember != null) {
			isUsable = "ok";
		}
		System.out.println("ok인가 아닌가 " + isUsable);
		map.put("isUsable", isUsable);
//		log.debug("checkMember={}", checkMember);
		
		
		return map;
	}

}

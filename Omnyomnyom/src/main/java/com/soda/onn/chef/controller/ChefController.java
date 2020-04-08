package com.soda.onn.chef.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.soda.onn.chef.model.service.ChefService;
import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.common.util.ChefRequestUtils;
import com.soda.onn.member.model.vo.Notice;
import com.soda.onn.recipe.model.vo.Recipe;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chef")
public class ChefController {

	@Autowired
	private ChefService chefservice;
	
	
// 셰프채널 메인 이동 
	@GetMapping("/chefList")
	public ModelAndView chefList() {
		ModelAndView mav = new ModelAndView();
		List<Chef> chefList = chefservice.selectChefAllList();
		
		
		for(Chef ch: chefList) {
			List<Map<String,String>> list = (List<Map<String,String>>) new Gson().fromJson(ch.getChefCategory(), 
											 new TypeToken<List<Map<String,String>>>(){}.getType());
			
			List<String> categoryList = new ArrayList<String>();
			
			for(Map<String,String> map: list) {
//	            log.debug(map.get("value"));
	            categoryList.add(map.get("value"));
	        }
			
			ch.setChefCategoryList(categoryList);
			
		}
		
        
		log.debug("chefList ={}",chefList);
		mav.addObject("chefList", chefList);
		mav.setViewName("/chef/chefList");
		return mav;
	}
	
	
	
//	셰프 닉네임으로 검색 
	@GetMapping("chefSearch")
	public ModelAndView chefSearch(@RequestParam(value="chefsearchBar",required=true)String chefsearchbar,
								ModelAndView mav) {
		List<Chef> chefList = chefservice.chefSearch(chefsearchbar);
		
		for(Chef ch: chefList) {
			List<Map<String,String>> list = (List<Map<String,String>>) new Gson().fromJson(ch.getChefCategory(), 
											 new TypeToken<List<Map<String,String>>>(){}.getType());
			
			List<String> categoryList = new ArrayList<String>();
			
			for(Map<String,String> map: list) {
//	            log.debug(map.get("value"));
	            categoryList.add(map.get("value"));
	        }
				ch.setChefCategoryList(categoryList);
			
//			log.debug("{}",ch.getChefCategoryList());
		}
		log.debug("chefSearch={}",chefList);
		
		mav.addObject("chefList", chefList);
		mav.setViewName("/chef/chefList");
		return mav;
}
	
//	셰프 채널 이동 
	@GetMapping(value="/{memberNickName}/chefPage",
			    produces= "text/plain;charset=utf-8")
	@ResponseBody
	public ModelAndView chefPage(@PathVariable("memberNickName") String chefNickName,
						ModelAndView mav) {
		
		Chef chef = chefservice.chefSelectOne(chefNickName);
		String chefId = chef.getChefId();
		log.debug("chefId={}",chefId);
		List<Recipe> recipeList = chefservice.recipeSelectAll(chefNickName);
		List<Notice> noticeList = chefservice.noticeSelectAll(chefId);
		log.debug("RecipeList = {}",recipeList);
		
		mav.addObject("noticeList",noticeList);
		mav.addObject("recipeList", recipeList);
		mav.addObject("chef", chef);
		mav.setViewName("chef/chefPage");
		return mav;
	}
	
// 셰프공지사항 글쓰기 폼 이동 
	@GetMapping("/chefNotice")
	public void chefNotice(){
	}
	
// 셰프공지사항 글쓰기 Insert 이동 
	@PostMapping("/chefNotice")
	public String  chefNoticeInsert(Notice notice,
									Model model){
		
		
		int result = chefservice.chefNoticeInsert(notice);
		log.debug("notice@ = {}",notice);

//		redirectAttributes.addFlashAttribute(result>0?"공지사항 등록 완료!":"공지사항 등록 실패!");
		log.debug("result={}",result);
		
		String url = "";
		
		if(result <= 0) url = "redirect:/chef/chefNotice";
		else  url = "redirect:/chef/noticeView?noticeNo="+notice.getNoticeNo();
		
	    return url;
		
	}
		
   @GetMapping("/noticeView")
	public ModelAndView chefNoticeView(@RequestParam(value ="noticeNo")  int noticeNo,
										ModelAndView mav) {
		
		Notice notice  = chefservice.chefNoticeView(noticeNo);
		
		mav.addObject("notice", notice);
		mav.setViewName("chef/noticeView");
		return mav;
	}
	
// 셰프신청 폼이동 
	@GetMapping("/chefInsert")
	public void chefInsert() {
		
	}
	
//	셰프시청 완료 후 인덱스 페이지 이동 
	@PostMapping("/chefInsert")
	public String chefRequest(ChefRequest chefRequest,
							HttpServletRequest request,
							@RequestParam (value="facebook") String facebook,
							@RequestParam(value ="insta") String insta,
							@RequestParam(value="chefProfileimg",required=true) MultipartFile chefProfile,
							@RequestParam(value="chefApVideoimg", required=true) MultipartFile chefApVideo,
							RedirectAttributes redirectAttribute) {
		
//		System.out.println(chefRequest);
//		
//		log.debug("facebook={}",facebook);
//		log.debug("insta={}",insta);

		// sns map객체 -> gson으로 넘김 
		Map<String,String> snsMap = new HashMap<String, String>();
		snsMap.put("facebook", facebook);
		snsMap.put("insta ", insta);

		Gson gson = new Gson();
		String snsGson = gson.toJson(snsMap);
		
		chefRequest.setSns(snsGson);
		
		
		//프로필 사진 닉네임으로 파일명 저장하기; 
		String profileOriginalFileName = chefProfile.getOriginalFilename();
		String chefAPVideoOriginalFileName = chefApVideo.getOriginalFilename();

		String profileRenamedFileName = ChefRequestUtils.getRenamedFileName(profileOriginalFileName, chefRequest.getChefNickName());
		String videoRenamedFileName = ChefRequestUtils.getRenamedFileName(chefAPVideoOriginalFileName , chefRequest.getChefNickName());
		
		//파일 이동
		String profileSaveDirectory = request.getServletContext().getRealPath("/resources/upload/profile");
		String chefApVideoSaveDirectory = request.getServletContext().getRealPath("/resources/upload/chefApVideo");
		try {
			chefProfile.transferTo(new File(profileSaveDirectory,profileRenamedFileName));
			chefApVideo.transferTo(new File(chefApVideoSaveDirectory,videoRenamedFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//실제 파일데이터 originalFileName, renamedFileName을 db에 저장
		chefRequest.setChefProfile(profileRenamedFileName);
		chefRequest.setChefApVideo(videoRenamedFileName);
//		
//		List<Map<String,String>> list = (List<Map<String,String>>)new Gson().fromJson(chefRequest.getMenuPrCategory(), 
//																   					  new TypeToken<List<Map<String,String>>>(){}.getType());
//        
//        if(!list.isEmpty()) {
//            log.debug(list.get(0).get("value"));
//        }
//		
		

		int result = chefservice.chefRequest(chefRequest);
		String msg=result > 0 ? "셰프신청이 완료되었습니다.":"셰프신청에 실패하셨습니다.";
		redirectAttribute.addFlashAttribute("msg", msg);
		
		return "redirect:/";
	}
	
	@PostMapping("/noticeDelete")
	public String chefNoticeDelete(@RequestParam(value="noticeNo") int noticeNo,
								   @RequestParam(value="memberNickName") String memberNickName) {
		log.debug("memberNickName@Delete ={}",memberNickName);
		int result = chefservice.chefNoticeDelete(noticeNo);
		
		try {
			
			String nickName = URLEncoder.encode(memberNickName, "UTF-8");
			nickName = nickName.replaceAll("\\+", "%20");
			log.debug("memberNickName@Delete@@@@ ={}",nickName);
			return "redirect:/chef/"+nickName+"/chefPage";
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@PostMapping("/noticeUpdate")
	public String chefNoticeUpdate(Notice notice,
								   Model model) {
		model.addAttribute("notice", notice);
		return"chef/noticeUpdate";
	}
	
	@PostMapping("/noticeUpdateDone")
	public String chefNoticeUpdateDone(Notice notice) {
		log.debug("notice@Update={}",notice);
		int result = chefservice.chefnoticeUpdate(notice);
		return "redirect:/chef/noticeView?noticeNo="+notice.getNoticeNo();
	}
}

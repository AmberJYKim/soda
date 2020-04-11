package com.soda.onn.recipe.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.jasper.tagplugins.jstl.core.Redirect;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver.Builder;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.recipe.model.service.RecipeService;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.Report;
import com.soda.onn.recipe.model.vo.RecipeWithIngCnt;
import com.soda.onn.recipe.model.vo.RecipeQuestion;
import com.soda.onn.recipe.model.vo.RecipeReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;

	final int NUMPERPAGE = 12;
	final int PAGEBARSIZE = 10;

	private RowBounds rowBounds = null;
	
	
	//레시피 뷰
	@GetMapping("/recipe-details")
	public String recipedetails(@RequestParam("recipeNo")int recipeNo,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  Model model) {
		
		Cookie[] cookies = request.getCookies();
		String recipeCookieVal = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				if("recipeCookie".equals(name)) {
					recipeCookieVal = value;
					if(value.contains("|"+ recipeNo +"|")) {
						hasRead=true;
						break;
					}
				}
						
			}
		}
		
		if(hasRead == false) {
			recipeCookieVal = recipeCookieVal + "|"+ recipeNo +"|";
			Cookie recipeCookie = new Cookie("recipeCookie",recipeCookieVal);
			recipeCookie.setMaxAge(7*24*60*60);
			recipeCookie.setPath(request.getContextPath()+"/recipe");
			response.addCookie(recipeCookie);
		}
		
		Member member = (Member)request.getSession().getAttribute("memberLoggedIn");
		Like l =null;
		Scrap s = null;
		
		
		if(member != null) {
			l = new Like(member.getMemberId(), recipeNo);
			
			l = recipeService.selectLikeOne(l);
			
			s = new Scrap(recipeNo, member.getMemberId(), null, null, null, null);
			
			s = recipeService.selectScrap(s);
		}
		log.debug("{}",l);
		
		Recipe recipe = recipeService.selectRecipeOne(recipeNo,hasRead);
		
		recipe.setIngredientList(recipeService.selectRecIngList(recipeNo));
		
		List<IngredientMall> ingrMallList = recipeService.selectingrMallList(recipe.getIngredientList());
		
		List<Recipe> relationRecipes =recipeService.selectRelRecipeList(recipe); 
		
		List<RecipeReply> replyList = recipeService.selectReplyList(recipe.getRecipeNo());
		
//		List<RecipeQuestion> questionList = recipeService.selectQuestionList(recipe.getRecipeNo());
		
		log.debug("{}",ingrMallList);
		
		log.debug("{}",relationRecipes);
		
		model.addAttribute("relationRecipes",relationRecipes);
		model.addAttribute("ingrMallList", ingrMallList);
		model.addAttribute("scrap",s);
		model.addAttribute("isLiked",l);
		model.addAttribute("recipe",recipe);
		
		return "/recipe/recipe-details";
	}
	
	//레시피 업로드 폼
	@GetMapping("/recipeUpload")
	public void recipeUpload(Model model) {
		List<MenuCategory> categoryList = recipeService.selectCategoryList();
		log.debug("{}",categoryList);
		model.addAttribute("categoryList", categoryList);
	}
	
	//레시피 업로드
	@PostMapping("/recipeUpload")
	public String recipeUpload(Recipe recipe,
							 @RequestParam(value = "chefId") String chefId,
							 @RequestParam(value = "chefNick") String chefNick,
							 @RequestParam(value = "uploadFile") MultipartFile uploadFile,
							 @RequestParam(value = "ingr_name") String[] ingrName,
							 @RequestParam(value = "ingr_mass") String[] ingrMass,
							 @RequestParam(value = "tn_firstname") int[] cookTime,
							 @RequestParam(value = "tn_lastname") String[] cookery,
							 @RequestParam(value = "ingr_number") int[] ingNo,
							 @ModelAttribute("memberLoggedIn")Member member) {
		
//		log.debug("{}",chef);
//		recipe.setChefId(chef.getMemberId());
//		recipe.setChefNick(chef.getMemberNick());
		recipe.setChefId(chefId);
		recipe.setChefNick(chefNick);
		
		log.debug("{}",member);
		
		log.debug("{}",recipe);
		
		if (!uploadFile.isEmpty()) {
			log.debug("{}",uploadFile.getOriginalFilename());
			
			YouTube youtubeService = null;
			try {
				youtubeService = getService();
			} catch (GeneralSecurityException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			// Define the Video object, which will be uploaded as the request body.
			Video video = new Video();

			VideoStatus status = new VideoStatus();

			status.setPrivacyStatus("unlisted");

			video.setStatus(status);

			VideoSnippet snippet = new VideoSnippet();

			snippet.setTitle(recipe.getVideoTitle());
			snippet.setDescription(recipe.getRecipeContent());

//        List<String> tags = new ArrayList<String>();
//        tags.add("이게");
//        tags.add("되면");
//        tags.add("좋겠다.");
//        snippet.setTags(tags);

			video.setSnippet(snippet);

			// TODO: For this request to work, you must replace "YOUR_FILE"
			// with a pointer to the actual file you are uploading.
			// The maximum file size for this operation is 128GB.
			// File mediaFile = new
			// File(httpRequest.getServletContext().getRealPath("resources"),"KakaoTalk_Video_20190719_1734_13_287.mp4");
			InputStreamContent mediaContent;
			try {
				mediaContent = new InputStreamContent("video/*", new BufferedInputStream(uploadFile.getInputStream()));
				mediaContent.setLength(uploadFile.getSize());

				// Define and execute the API request
				YouTube.Videos.Insert request = youtubeService.videos().insert("snippet,statistics,status", video,
						mediaContent);

				Video response = request.execute();
				log.debug("youtubeId={}",response.getId());
				recipe.setVideoLink(response.getId());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		List<RecipeIngredient> ingredientList = new ArrayList<RecipeIngredient>();
		
		for(int i =0;i<ingrName.length ;i++) {
			RecipeIngredient ingr = new RecipeIngredient(ingNo[i], ingrMass[i], ingrName[i], 0);
			ingredientList.add(ingr);
		}
		log.debug(ingredientList.toString());
		
		List<Map<String,String>> list = (List<Map<String,String>>)new Gson().fromJson(recipe.getCategory(), new TypeToken<List<Map<String,String>>>(){}.getType());
		
		if(!list.isEmpty()) {
			log.debug(list.get(0).get("value"));
			recipe.setCategory(list.get(0).get("value"));
		}
		
		recipe.setTimeline("");
		for(int i =0;i < cookTime.length ;i++) {
			
			if(i>0)
				recipe.setTimeline(recipe.getTimeline()+"⇔");
			
			recipe.setCookingTime(recipe.getCookingTime()+cookTime[i]);
			recipe.setTimeline(recipe.getTimeline() + cookTime[i]+"∮"+cookery[i]);
		}
		
		log.debug("{}",recipe);
		
		int result = recipeService.recipeUpload(recipe,ingredientList);
		
		log.debug("insert Result={}", result>0?true:false);
		
		if(result<=0)
			return "redirect:/recipe/recipeUpload";
		
		return "redirect:/recipe/recipe-details?recipeNo=" + recipe.getRecipeNo();
	}

	@GetMapping("/recipeUpdate")
	public void recipeUpdate() {
		
	}
	
	//메뉴검색 페이지 요청 시 인기영상과 메뉴 카테고리 가져가기
	@GetMapping("/recipe-menu-search")
	public ModelAndView recipemenusearch(ModelAndView mav) {
		List<RecipeWithIngCnt> popRecipe = recipeService.selectPopRecipe();
		
		
		mav.addObject("popRecipe", popRecipe);
		mav.setViewName("recipe/recipe-menu-search");
		
		return mav;
	}
	
	//레시피 페이지 이동 -냉부
	@GetMapping("/ingredientsSelection")
	public ModelAndView selectedIngredientsList(ModelAndView mav) {
		
		List<RecipeWithIngCnt> popRecipe = recipeService.selectPopRecipe();
		log.debug(popRecipe.toString());
		mav.addObject("popRecipe", popRecipe);
		mav.setViewName("recipe/ingredientsSelection");
		
		return mav;
	}
	
	//중분류카테고리 가져오기 처리용 -냉부
	@GetMapping("getSubCtg")
	@ResponseBody
	public List<String> selectIngSubCtg(String mainCtg) {
		log.debug("mainCtg = dd{}", mainCtg);
		
		List<String> subCtgList = recipeService.selectIngSubCtg(mainCtg);
		
		subCtgList.add(0, "인기재료"); //자동으로 이벤트 처리되어 인기재료소환함, 다른 ajax에의해서
		
		log.debug("controller list={}", subCtgList.toString());
		return subCtgList;
	}
	
	//레시피 업로드 폼에서 재료명 가져오기 위한 에이잭스
	@GetMapping(value = "/{ingredient}/ajax", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String ingredientAjax(@PathVariable("ingredient") String ingr) {
		log.debug(ingr);
		if(ingr == null || ingr.equals("")) {
			return "[]";
		}
		
		List<Ingredient> list = recipeService.ingredientAjax(ingr); 
		
		JsonArray jArray = new JsonArray();
		for(Ingredient i : list) {
			JsonObject jObj = new JsonObject();
			jObj.addProperty("ingredientName", i.getIngredientName());
			jObj.addProperty("ingredientNo", i.getIngredientNo());
			jArray.add(jObj);
		}
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		log.debug("{}",list);
		log.debug(gson.toJson(jArray));
		return gson.toJson(jArray);
	}
	
	//레시피 뷰에서 좋아요
	@GetMapping(value = "/{memberId}/like/{recipeNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertLike(@PathVariable("memberId")String memberId,
							 @PathVariable("recipeNo")int recipeNo) {
		log.debug("like");
		
		Like like = new Like(memberId, recipeNo);
		int result = recipeService.insertLike(like);
		
		return result>0?"t":"f";
	}
	
	//레시피 뷰에서 좋아요 취소
	@GetMapping(value = "/{memberId}/unlike/{recipeNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteLike(@PathVariable("memberId")String memberId,
							 @PathVariable("recipeNo")int recipeNo) {
		log.debug("unlike");
		
		Like like = new Like(memberId, recipeNo);
		int result = recipeService.deleteLike(like);
		
		return result>0?"t":"f";
	}

	//레시피 뷰 스크랩 해제
	@GetMapping(value = "/unscrap/{recipeNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteScrap(HttpSession session,
						 	  @PathVariable("recipeNo")int recipeNo) {
		log.debug("unscraped");
		log.debug("{}",(Member)session.getAttribute("memberLoggedIn"));
		Scrap scrap = new Scrap(recipeNo, ((Member)session.getAttribute("memberLoggedIn")).getMemberId(), null, null, null, null);
		
		log.debug("{}",scrap);
		
		int result = recipeService.deleteScrap(scrap);
		
		return result>0?"t":"f";
	}
	
	//레시피 뷰 스크랩
	@GetMapping(value = "/scrap/{recipeNo}", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertScrap(HttpSession session,
						 	  @PathVariable("recipeNo")int recipeNo,
						 	  @RequestParam("memo")String memo) {
		log.debug("scraped");
		log.debug("{}",(Member)session.getAttribute("memberLoggedIn"));
		Scrap scrap = new Scrap(recipeNo, ((Member)session.getAttribute("memberLoggedIn")).getMemberId(), null, memo, null, null);
		
		log.debug("{}",scrap);
		
		int result = recipeService.insertScrap(scrap);
		
		return result>0?"t":"f";
	}
	
	
	/*
	 * Copyright 2020 the original author or authors.
	 *
	 * Licensed under the Apache License, Version 2.0 (the "License");
	 * you may not use this file except in compliance with the License.
	 * You may obtain a copy of the License at
	 *
	 *      https://www.apache.org/licenses/LICENSE-2.0
	 *
	 * Unless required by applicable law or agreed to in writing, software
	 * distributed under the License is distributed on an "AS IS" BASIS,
	 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 * See the License for the specific language governing permissions and
	 * limitations under the License.
	 */
	private static final String CLIENT_SECRETS= "/client_secret.json";
    private static final Collection<String> SCOPES =
        Arrays.asList("https://www.googleapis.com/auth/youtube.upload");
    	

    private static final String APPLICATION_NAME = "레시피 등록";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    /**
     * Create an authorized Credential object.
     *
     * @return an authorized Credential object.
     * @throws IOException
     */
    //유튜브 등록 전 권한 받기
    public static Credential authorize(final NetHttpTransport httpTransport) throws IOException {
        // Load client secrets.
    	
        InputStream in = RecipeController.class.getResourceAsStream(CLIENT_SECRETS);
        GoogleClientSecrets clientSecrets =
          GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
        
        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow =
            new GoogleAuthorizationCodeFlow.Builder(httpTransport, JSON_FACTORY, clientSecrets, SCOPES).build();
        
        Builder localBuilder =  new LocalServerReceiver.Builder().setHost("localhost").setPort(20202);

        LocalServerReceiver local = localBuilder.build();

        AuthorizationCodeInstalledApp authoApp = new AuthorizationCodeInstalledApp(flow, local);

        //여기서 걸린다!
        Credential credential = authoApp.authorize("user");

        return credential;
    }

    /**
     * Build and return an authorized API client service.
     *
     * @return an authorized API client service
     * @throws GeneralSecurityException, IOException
     */
    //유튜브 권한 요청 및 유튜브 객체 제작
    public static YouTube getService() throws GeneralSecurityException, IOException {
    	
        final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
        Credential credential = authorize(httpTransport);
        
        return new YouTube.Builder(httpTransport, JSON_FACTORY, credential)
            .setApplicationName(APPLICATION_NAME)
            .build();
    }
	
	//중분류 선택에 따른 재료가져오기 처리
	@GetMapping(value ="getIng", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectIngredients(@RequestParam(value="cPage", defaultValue="1") int cPage, String subCtg, String mainCtg, HttpServletRequest request ) {
		
		Map<String, Object> maps = new HashMap<>();
				List<Ingredient> ingList = new ArrayList<>();
		
		maps.put("mainCtg", mainCtg);
		maps.put("subCtg", subCtg);
		
		if(subCtg.equals("인기재료")) {
			if(maps.get("subCtg").equals("인기재료"))
			maps.put("subCtg", null);
			if(maps.get("mainCtg").equals("인기재료"))
			maps.put("mainCtg", null);
			
			log.debug(" 카테고리 설정 받아온값 mainCtg=={} subCtg== {}", mainCtg, subCtg);
			log.debug(" 카테고리 설정 후 mainCtg=={} subCtg== {}", maps.get("mainCtg"), maps.get("subCtg"));
			ingList = recipeService.selectPopIngredient(maps);
		}else {
			ingList = recipeService.selectIngredients(subCtg, cPage, NUMPERPAGE);
		}
		log.debug("controller list={}", ingList.toString());
		log.debug("subCtg============{}", subCtg);
		
		//서브카태고리 재료 총 갯수 조회
		int ingCnt = recipeService.selectIngredientsCnt(subCtg);
		
		//카테고리 갯수에 따른 페이징 여부 (12개 이하일 경우 페이징 하지 않음)
		if(ingCnt > 12) {
			ingCnt = (int)Math.ceil((double)ingCnt/12);
		} else {
			ingCnt = 1;
		}
		
		//재료&페이징 맵에 담기
		maps.put("ingList", ingList);
		maps.put("ingCnt", ingCnt);
		maps.put("cPage", cPage);
		
		String gList = new Gson().toJson(maps);

		return gList;
	}
	
	
	@GetMapping("/report")
	@ResponseBody
	public String report(String memberId, int replyNo, Date dateReport, String memo) {
		
		Report rp = new Report(memberId, replyNo, dateReport , memo);
		
		Report rep = recipeService.selectReport(rp);
		
		String result = "";
		
		if(rep != null) {
			result = "신고한 내역이 있는 댓글은 신고접수를 할 수가 없습니다.";
		}
		else {
			int reportInsert = recipeService.insertReport(rp);
			
			if(reportInsert == 1) {
				result = "신고가 접수 되었습니다.";	
			}
		}
		
		String gsonresult = new Gson().toJson(result);
		 
		return gsonresult;
  }
	//선택한 재료로 레시피 검색하기
	@GetMapping(value="recipeSerachByIng", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String recipeSerachByIng(@RequestParam("ingNoArr[]") List<Integer> ingNoArr) {
		
		log.debug("ingredientNo======={}", ingNoArr);
		
		Map<String, Object> maps = new HashMap<>();
		maps.put("ingNoArr", ingNoArr);
				
		List<RecipeWithIngCnt> rlist = recipeService.recipeSerachByIng(maps);
		log.debug("rlist================{}", rlist.toString());
		
		maps.put("recipeList", rlist);
		
		return new Gson().toJson(maps);
		
	}
	
	//메뉴이름으로 레시피 검색하기
	@GetMapping("searchByMenu")
	public ModelAndView recipeSearchByMenu(@RequestParam("searchKeyword") String searchKey) {
		ModelAndView mav = new ModelAndView();
		
		
		log.debug(searchKey);
		
		List<RecipeWithIngCnt> rList = recipeService.recipeSearchByMenu(searchKey);	
		List<RecipeWithIngCnt> popRecipe = recipeService.selectPopRecipe();
		
		log.debug(""+rList.toString());
		mav.addObject("searchKey", searchKey);
		mav.addObject("searchedList", rList);
		mav.addObject("popRecipe", popRecipe);
		mav.setViewName("/recipe/recipe-menu-search");
		
		return mav;
	}
	
	//중분류카테고리 가져오기 처리용 -메뉴
	@GetMapping("getSubMenuCtg")
	@ResponseBody
	public List<String> selectMenuSubCtg(String mainCtg) {
		log.debug("mainCtg = dd{}", mainCtg);
		
		List<String> subCtgList = recipeService.selectMenuSubCtg(mainCtg);
	
		
		log.debug("controller list={}", subCtgList.toString());
		return subCtgList;
	}
}

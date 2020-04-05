package com.soda.onn.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.soda.onn.common.base.PageBar;
import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.service.RecipeService;

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
	
	
	
	@GetMapping("/recipe-details.do")
	public void recipedetails() {
		
	}
	@GetMapping("/recipeUpload.do")
	public void recipeUpload() {
		
	}
	@GetMapping("/recipeUpdate.do")
	public void recipeUpdate() {
		
	}
	
	@GetMapping("/recipe-menu-search.do")
	public void recipemenusearch() {
		
	}
	
	@GetMapping("/ingredientsSelection.do")
	public String selectedIngredientsList() {
		
		
		
		return "recipe/ingredientsSelection";
	}
	
	//중분류카테고리 가져오기 처리용
	@GetMapping("getSubCtg")
	@ResponseBody
	public List<String> selectIngSubCtg(String mainCtg) {
		log.debug("mainCtg = dd{}", mainCtg);
		
		List<String> subCtgList = recipeService.selectIngSubCtg(mainCtg);
		
		subCtgList.add(0, "인기재료");
		//몰의 판매된 재료에서 인기재료 가져오기
		
		
		log.debug("controller list={}", subCtgList.toString());
		return subCtgList;
	}
	
	
	//중분류 선택에 따른 재료가져오기 처리
	@GetMapping(value ="getIng", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectIngredients(@RequestParam(value="cPage", defaultValue="1") int cPage, String subCtg, HttpServletRequest request ) {
		log.debug("subCtg controller = {}", subCtg);
		
		Map<String, Object> maps = new HashMap<>();
		
				
		List<Ingredient> ingList = recipeService.selectIngredients(subCtg, cPage, NUMPERPAGE);
		log.debug("controller list={}", ingList.toString());
		
		//서브카태고리 재료 총 갯수 조회
		int ingCnt = recipeService.selectIngredientsCnt(subCtg);

		//카테고리 갯수에 따른 페이징 여부 (12개 이하일 경우 페이징 하지 않음)
		if(ingCnt < 12) {
			ingCnt = ingCnt % 12;
			log.debug("ingCnt 12보다 큼 ===={}", ingCnt);
		} else {
			ingCnt = 0;
			log.debug("ingCnt 12보다 작음 ===={}", ingCnt);
		}
		
//		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);		
		//재료&페이징 맵에 담기
		
		maps.put("ingList", ingList);
		maps.put("ingCnt", ingCnt);
		
		
		String gList = new Gson().toJson(maps);

		return gList;
	}
}

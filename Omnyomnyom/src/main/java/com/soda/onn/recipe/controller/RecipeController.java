package com.soda.onn.recipe.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soda.onn.common.base.PageBar;
import com.soda.onn.mall.model.vo.BuyHistory;
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
		
		log.debug("controller list={}", subCtgList.toString());
		return subCtgList;
	}
	
	
	//중분류 선택에 따른 재료가져오기 처리
	@GetMapping("getIng")
	@ResponseBody
	public List<Ingredient> selectIngredients(@RequestParam(value="cPage", defaultValue="1") int cPage, String subCtg ) {
		log.debug("subCtg controller = {}", subCtg);
		
		List<Ingredient> ingList = recipeService.selectIngredients(subCtg);
		log.debug("controller list={}", ingList.toString());
		
		rowBounds = new RowBounds((cPage-1)*NUMPERPAGE, NUMPERPAGE);
		int pageStart = ((cPage - 1)/PAGEBARSIZE) * PAGEBARSIZE +1;
		int pageEnd = pageStart+PAGEBARSIZE-1;
		int totalCount = recipeService.selectIngredientsCnt (subCtg);
		int totalPage =  (int)Math.ceil((double)totalCount/NUMPERPAGE);
		String url = request.getRequestURL().toString();
		String paging = PageBar.Paging(url, cPage, pageStart, pageEnd, totalPage);
		
//		
		mav.addObject("paging", paging);
		
		
//		return ingList;
		
		return null;
	}
}

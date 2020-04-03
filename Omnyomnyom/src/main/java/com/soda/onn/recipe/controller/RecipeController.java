package com.soda.onn.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.member.model.vo.Member;
import com.soda.onn.recipe.model.service.RecipeService;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/recipe-details")
	public void recipedetails() {
		
	}
	@GetMapping("/recipeUpload")
	public void recipeUpload() {
		
	}
	
	@PostMapping("/recipeUpload")
	public void recipeUpload(Recipe recipe,
							 @ModelAttribute("memberLoggedIn") Member chef,
							 @RequestParam(value = "uploadFile") MultipartFile uploadFile,
							 @RequestParam(value = "ingr_name") String[] ingrName,
							 @RequestParam(value = "ingr_mass") String[] ingrMass,
							 @RequestParam(value = "tn_firstname") int[] cookTime,
							 @RequestParam(value = "tn_lastname") String[] cookery,
							 @RequestParam(value = "ingr_number") int[] ingNo,
							 @RequestParam(value = "editor1") String Content) {
		log.debug("{}",uploadFile.getOriginalFilename());
		
		recipe.setChefId(chef.getMemberId());
		recipe.setChefNick(chef.getMemberNick());
		recipe.setRecipeContent(Content);
		
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
				recipe.setTimeline(recipe.getTimeline()+"/");
			
			recipe.setCookingTime(recipe.getCookingTime()+cookTime[i]);
			recipe.setTimeline(recipe.getTimeline() + cookTime[i]+":"+cookery[i]);
		}
		
		log.debug("{}",recipe);
		
	}
	
	@GetMapping("/recipeUpdate")
	public void recipeUpdate() {
		
	}
	
	@GetMapping("/recipe-menu-search")
	public void recipemenusearch() {
		
	}
	
	@GetMapping("/ingredientsSelection")
	public String selectedIngredientsList() {
		return "recipe/ingredientsSelection";
	}
	
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
	
	
}

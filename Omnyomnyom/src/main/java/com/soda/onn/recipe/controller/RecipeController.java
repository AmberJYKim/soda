package com.soda.onn.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.soda.onn.recipe.model.service.RecipeService;
import com.soda.onn.recipe.model.vo.Recipe;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/recipe-details.do")
	public void recipedetails() {
		
	}
	@GetMapping("/recipeUpload.do")
	public void recipeUpload() {
		
	}
	
	@PostMapping("/recipeUpload.do")
	public void recipeUpload(Recipe recipe,
							 @RequestParam(value = "uploadFile") MultipartFile uploadFile,
							 String string) {
		log.debug("{}",recipe);
		log.debug("{}",uploadFile.getOriginalFilename());
		
		List<Map<String,String>> map = (List<Map<String,String>>) new Gson().fromJson(recipe.getCategory(), new TypeToken<List<Map<String,String>>>(){}.getType());
		log.debug(map.get(0).get("value"));
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
	
	
}

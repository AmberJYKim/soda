package com.soda.onn.recipe.model.service;

import java.util.List;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.dao.RecipeDAO;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;


@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Override
	public List<Ingredient> ingredientAjax(String ingr) {
		return recipeDAO.ingredientAjax(ingr);
	}

	@Override
	public List<String> selectIngSubCtg(String mainCtg) {
		return recipeDAO.selectIngSubCtg(mainCtg);
	}

	@Override
	public List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage) {
		return recipeDAO.selectIngredients(subCtg, cPage, numPerPage);
	}

	@Override
	public int selectIngredientsCnt(String subCtg) {
		return recipeDAO.selectIngredientsCnt(subCtg);
	}
	
	public int recipeUpload(Recipe recipe, List<RecipeIngredient> ingredientList) {
		int result = recipeDAO.recipeUpload(recipe);
		Log.debug("recipeNo={}",recipe.getRecipeNo());
		
		if(result >0) {
			for(RecipeIngredient ingr : ingredientList) {
				ingr.setRecipeNo(recipe.getRecipeNo());
				result = recipeDAO.recipeIngrUpload(ingr);
			}
		}
		
		return result;
	}

}

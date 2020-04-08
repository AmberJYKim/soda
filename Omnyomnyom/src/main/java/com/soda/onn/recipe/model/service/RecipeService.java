package com.soda.onn.recipe.model.service;

import java.util.List;
import java.util.Map;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.RecipeWithIngCnt;

public interface RecipeService {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int nUMPERPAGE);

	int selectIngredientsCnt(String subCtg);

	int recipeUpload(Recipe recipe, List<RecipeIngredient> ingredientList);

	List<Ingredient> ingredientAjax(String ingr);

	Recipe selectRecipeOne(int recipeNo);

	List<RecipeIngredient> selectRecIngList(int recipeNo);

	List<RecipeWithIngCnt> recipeSerachByIng(Map<String, Object> maps);

	List<RecipeWithIngCnt> selectPopRecipe();

	List<Ingredient> selectPopIngredient(Map<String, Object> maps);

	List<String> selectMenuCtg();

}

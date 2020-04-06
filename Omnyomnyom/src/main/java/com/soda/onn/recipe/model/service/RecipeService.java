package com.soda.onn.recipe.model.service;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

public interface RecipeService {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int nUMPERPAGE);

	int selectIngredientsCnt(String subCtg);

  int recipeUpload(Recipe recipe, List<RecipeIngredient> ingredientList);

	List<Ingredient> ingredientAjax(String ingr);

}

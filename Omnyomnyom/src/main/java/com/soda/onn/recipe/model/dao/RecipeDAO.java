package com.soda.onn.recipe.model.dao;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

public interface RecipeDAO {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage);

	int selectIngredientsCnt(String subCtg);
	List<Ingredient> ingredientAjax(String ingr);

	int recipeUpload(Recipe recipe);

	int recipeIngrUpload(RecipeIngredient ingr);

}

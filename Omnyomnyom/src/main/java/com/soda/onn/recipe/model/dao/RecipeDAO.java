package com.soda.onn.recipe.model.dao;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

public interface RecipeDAO {

	List<Ingredient> ingredientAjax(String ingr);

	List<String> selectIngSubCtg(String mainCtg);

	int recipeUpload(Recipe recipe);

	int recipeIngrUpload(RecipeIngredient ingr);

}

package com.soda.onn.recipe.model.service;

import java.util.List;
import java.util.Map;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

public interface RecipeService {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int nUMPERPAGE);

	int selectIngredientsCnt(String subCtg);

	int recipeUpload(Recipe recipe, List<RecipeIngredient> ingredientList);

	List<Ingredient> ingredientAjax(String ingr);

	Recipe selectRecipeOne(int recipeNo);

	List<RecipeIngredient> selectRecIngList(int recipeNo);

	List<MenuCategory> selectCategoryList();

	Like selectLikeOne(Like l);

	int insertLike(Like like);

	int deleteLike(Like like);
}

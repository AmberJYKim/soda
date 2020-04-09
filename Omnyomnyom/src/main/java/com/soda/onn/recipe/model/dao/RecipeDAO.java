package com.soda.onn.recipe.model.dao;

import java.util.List;
import java.util.Map;

import com.soda.onn.recipe.model.vo.Report;
import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.recipe.model.service.Report;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.RelRecipeSelecter;

public interface RecipeDAO {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage);

	int selectIngredientsCnt(String subCtg);
	List<Ingredient> ingredientAjax(String ingr);

	int recipeUpload(Recipe recipe);

	int recipeIngrUpload(RecipeIngredient ingr);

	Recipe selectRecipeOne(int recipeNo);

	List<RecipeIngredient> selectRecIngList(int recipeNo);

	List<MenuCategory> selectCategoryList();

	Like selectLikeOne(Like l);

	int insertLike(Like like);

	int deleteLike(Like like);

	Scrap selectScrap(Scrap s);

	int deleteScrap(Scrap scrap);

	int insertScrap(Scrap scrap);

// 	List<Report> selectReportList();

  int increaseReadCount(int recipeNo);

	List<IngredientMall> selectIngrMallListIn(Map listMap);

	List<IngredientMall> selectIngrMallListNotIn(Map listMap, int i);

	List<Recipe> selectRelRecipeList(RelRecipeSelecter rrs, int listSize);

	List<Recipe> selectRelRecipeListPr(RelRecipeSelecter rrs, int i);

	List<Recipe> selectRelRecipeListAll(RelRecipeSelecter rrs, int i);
}

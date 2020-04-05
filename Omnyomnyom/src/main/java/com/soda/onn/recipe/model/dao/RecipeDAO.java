package com.soda.onn.recipe.model.dao;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;

public interface RecipeDAO {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage);

	int selectIngredientsCnt(String subCtg);

}

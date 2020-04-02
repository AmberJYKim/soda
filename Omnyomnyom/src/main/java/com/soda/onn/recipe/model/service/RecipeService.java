package com.soda.onn.recipe.model.service;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;

public interface RecipeService {

	List<String> selectIngSubCtg(String mainCtg);

	List<Ingredient> selectIngredients(String subCtg);

}

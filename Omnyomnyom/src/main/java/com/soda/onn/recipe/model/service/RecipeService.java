package com.soda.onn.recipe.model.service;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;

public interface RecipeService {

	List<Ingredient> ingredientAjax(String ingr);

}

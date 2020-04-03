package com.soda.onn.recipe.model.dao;

import java.util.List;

import com.soda.onn.mall.model.vo.Ingredient;

public interface RecipeDAO {

	List<Ingredient> ingredientAjax(String ingr);

}

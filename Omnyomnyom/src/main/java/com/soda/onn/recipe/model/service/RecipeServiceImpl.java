package com.soda.onn.recipe.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.dao.RecipeDAO;


@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired RecipeDAO recipeDAO;

	@Override
	public List<String> selectIngSubCtg(String mainCtg) {
		
		return recipeDAO.selectIngSubCtg(mainCtg);
	}

	@Override
	public List<Ingredient> selectIngredients(String subCtg) {
		return recipeDAO.selectIngredients(subCtg);
	}

}

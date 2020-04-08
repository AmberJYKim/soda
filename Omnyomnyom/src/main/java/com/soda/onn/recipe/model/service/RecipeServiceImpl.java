package com.soda.onn.recipe.model.service;

import java.util.List;
import java.util.Map;

import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.recipe.model.dao.RecipeDAO;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;


@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Override
	public List<Ingredient> ingredientAjax(String ingr) {
		return recipeDAO.ingredientAjax(ingr);
	}

	@Override
	public List<String> selectIngSubCtg(String mainCtg) {
		return recipeDAO.selectIngSubCtg(mainCtg);
	}

	@Override
	public List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage) {
		return recipeDAO.selectIngredients(subCtg, cPage, numPerPage);
	}

	@Override
	public int selectIngredientsCnt(String subCtg) {
		return recipeDAO.selectIngredientsCnt(subCtg);
	}
	
	@Override
	public int recipeUpload(Recipe recipe, List<RecipeIngredient> ingredientList) {
		int result = recipeDAO.recipeUpload(recipe);
		Log.debug("recipeNo={}",recipe.getRecipeNo());
		
		if(result >0) {
			for(RecipeIngredient ingr : ingredientList) {
				ingr.setRecipeNo(recipe.getRecipeNo());
				result = recipeDAO.recipeIngrUpload(ingr);
			}
		}
		
		return result;
	}

	@Override
	public Recipe selectRecipeOne(int recipeNo) {
		return recipeDAO.selectRecipeOne(recipeNo);
	}

	@Override
	public List<RecipeIngredient> selectRecIngList(int recipeNo) {
		return recipeDAO.selectRecIngList(recipeNo);
	}

	@Override
	public List<MenuCategory> selectCategoryList() {
		return recipeDAO.selectCategoryList();
	}

	@Override
	public Like selectLikeOne(Like l) {
		return recipeDAO.selectLikeOne(l);
	}

	@Override
	public int insertLike(Like like) {
		return recipeDAO.insertLike(like);
	}

	@Override
	public int deleteLike(Like like) {
		return recipeDAO.deleteLike(like);
	}

	@Override
	public Scrap selectScrap(Scrap s) {
		return recipeDAO.selectScrap(s);
	}

	@Override
	public int deleteScrap(Scrap scrap) {
		return recipeDAO.deleteScrap(scrap);
	}

	@Override
	public int insertScrap(Scrap scrap) {
		return recipeDAO.insertScrap(scrap);
	}
}

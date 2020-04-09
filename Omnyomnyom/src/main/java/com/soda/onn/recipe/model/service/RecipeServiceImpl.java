package com.soda.onn.recipe.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.soda.onn.recipe.model.vo.Report;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.recipe.model.dao.RecipeDAO;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.RecipeReply;
import com.soda.onn.recipe.model.vo.RelRecipeSelecter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		log.debug("recipeNo={}",recipe.getRecipeNo());
		
		if(result >0) {
			for(RecipeIngredient ingr : ingredientList) {
				ingr.setRecipeNo(recipe.getRecipeNo());
				result = recipeDAO.recipeIngrUpload(ingr);
			}
		}
		
		return result;
	}

	@Override
	public Recipe selectRecipeOne(int recipeNo,boolean hasRead) {
		int result = 0;
		
		if(!hasRead) {
			result = recipeDAO.increaseReadCount(recipeNo);
		}
		
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

	@Override
	public List<Report> selectReportList() {
		return recipeDAO.selectReportList();
  }
  
  @Override
  public List<IngredientMall> selectingrMallList(List<RecipeIngredient> ingredientList) {
		List<RecipeIngredient> selectList = new ArrayList<RecipeIngredient>();
		int mallSize = 15;
		for(RecipeIngredient r : ingredientList) {
			if(r.getIngredientNo() != 0)
				selectList.add(r);
		}
		Map listMap = new HashMap<String, List<RecipeIngredient>>();
		
		listMap.put("selectList", selectList);
		
		log.debug("{},{}",listMap.get("selectList"), selectList.size());
		
		List<IngredientMall> mallList = null;
		
		if(selectList.size() >0)
			mallList = recipeDAO.selectIngrMallListIn(listMap);
		else
			mallList = new ArrayList<IngredientMall>();
		
		log.debug("{},{}",mallList, mallList.size());
		List<IngredientMall> addList = null;
		if(mallList.size()<mallSize) {
			addList = recipeDAO.selectIngrMallListNotIn(listMap,mallSize-mallList.size());
			log.debug("{}",addList);
			mallList.addAll(addList);
		}
		
		
		
		return mallList;
	}

	@Override
	public List<Recipe> selectRelRecipeList(Recipe recipe) {
		int listSize = 5;
		RelRecipeSelecter rrs = new RelRecipeSelecter(recipe.getCategory(), recipe.getRecipeNo(), null);
		
		List<Recipe> relRecipes = recipeDAO.selectRelRecipeList(rrs,listSize);
		
		if(relRecipes == null)
			relRecipes = new ArrayList<Recipe>();
		
		rrs.setCategory(recipe.getCategory().split("/")[0]);
		rrs.setRelRecipeList(relRecipes);
		
		if(relRecipes.size()<listSize) {
			List<Recipe> prRelRecipes = recipeDAO.selectRelRecipeListPr(rrs,listSize-relRecipes.size());
			relRecipes.addAll(prRelRecipes);
		}

		rrs.setRelRecipeList(relRecipes);
		
		if(relRecipes.size()<listSize) {
			List<Recipe> allRelRecipes = recipeDAO.selectRelRecipeListAll(rrs,listSize-relRecipes.size());
			relRecipes.addAll(allRelRecipes);
		}
		
		return relRecipes;
	}

	@Override
	public List<RecipeReply> selectReplyList(int recipeNo) {
		// TODO Auto-generated method stub
		return null;
	}
}

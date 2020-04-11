package com.soda.onn.recipe.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.soda.onn.recipe.model.vo.Report;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mypage.model.vo.Scrap;
import com.soda.onn.recipe.model.vo.Like;
import com.soda.onn.recipe.model.vo.MenuCategory;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.RecipeWithIngCnt;
import com.soda.onn.recipe.model.vo.RelRecipeSelecter;

@Repository
public class RecipeDAOImpl  implements RecipeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Ingredient> ingredientAjax(String ingr) {
		return sqlSession.selectList("recipe.ingredientAjax", ingr);
	}

	@Override
	public List<String> selectIngSubCtg(String mainCtg) {
		return sqlSession.selectList("recipe.selectIngSubCtg", mainCtg);
	}

	@Override
	public List<Ingredient> selectIngredients(String subCtg, int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("recipe.selectIngredients", subCtg, rowBounds);
	}

	@Override
	public int selectIngredientsCnt(String subCtg) {
		return sqlSession.selectOne("recipe.selectIngredientsCnt", subCtg);
	}

	@Override
	public int recipeUpload(Recipe recipe) {
		return sqlSession.insert("recipe.recipeUpload", recipe);
	}

	@Override
	public int recipeIngrUpload(RecipeIngredient ingr) {
		return sqlSession.insert("recipe.recipeIngrUpload", ingr);
	}

	@Override
	public Recipe selectRecipeOne(int recipeNo) {
		return sqlSession.selectOne("recipe.selectRecipeOne",recipeNo);
	}

	@Override
	public List<RecipeIngredient> selectRecIngList(int recipeNo) {
		return sqlSession.selectList("recipe.selectRecIngList", recipeNo);
	}
	
	@Override
	public List<MenuCategory> selectCategoryList() {
		return sqlSession.selectList("recipe.selectCategoryList");
	}

	@Override
	public Like selectLikeOne(Like l) {
		return sqlSession.selectOne("recipe.selectLikeOne", l);
	}

	@Override
	public int insertLike(Like like) {
		return sqlSession.insert("recipe.insertLike", like);
	}

	@Override
	public int deleteLike(Like like) {
		return sqlSession.delete("recipe.deleteLike", like);
	}

	@Override
	public Scrap selectScrap(Scrap s) {
		return sqlSession.selectOne("recipe.selectScrap",s);
	}

	@Override
	public int deleteScrap(Scrap scrap) {
		return sqlSession.delete("recipe.deleteScrap", scrap);
	}

	@Override
	public int insertScrap(Scrap scrap) {
		return sqlSession.insert("recipe.insertScrap", scrap);
	}
	
	@Override
	public List<Report> selectReportList() {
		return sqlSession.selectList("recipe.selectReportList");
  }
  
  @Override
	public int increaseReadCount(int recipeNo) {
		return sqlSession.update("recipe.increaseReadCount", recipeNo);
	}

	@Override
	public List<IngredientMall> selectIngrMallListIn(Map listMap) {
		return sqlSession.selectList("recipe.selectIngrMallListIn", listMap);
	}

	@Override
	public List<IngredientMall> selectIngrMallListNotIn(Map listMap, int i) {
		RowBounds rowBounds = new RowBounds(0, i);
		return sqlSession.selectList("recipe.selectIngrMallListNotIn", listMap, rowBounds);
	}

	@Override
	public List<Recipe> selectRelRecipeList(RelRecipeSelecter rrs, int listSize) {
		RowBounds rowBounds = new RowBounds(0, listSize);
		return sqlSession.selectList("recipe.selectRelRecipeList", rrs, rowBounds);
	}

	@Override
	public List<Recipe> selectRelRecipeListPr(RelRecipeSelecter rrs, int i) {
		RowBounds rowBounds = new RowBounds(0, i);
		return sqlSession.selectList("recipe.selectRelRecipeListPr", rrs, rowBounds);
	}

	@Override
	public List<Recipe> selectRelRecipeListAll(RelRecipeSelecter rrs, int i) {
		RowBounds rowBounds = new RowBounds(0, i);
		return sqlSession.selectList("recipe.selectRelRecipeListAll", rrs, rowBounds);
	}
	
	@Override
	public List<RecipeWithIngCnt> recipeSerachByIng(Map<String, Object> maps) {
		return sqlSession.selectList("recipe.recipeSerachByIng", maps);
	}

	@Override
	public List<RecipeWithIngCnt> selectPopRecipe() {
		return sqlSession.selectList("recipe.selectPopRecipe");
	}

	@Override
	public List<Ingredient> selectPopIngredient(Map<String, Object> maps) {
		return sqlSession.selectList("recipe.selectPopIngredient", maps);
	}

	@Override
	public List<RecipeWithIngCnt> recipeSearchByMenu(String searchKey) {
		return sqlSession.selectList("recipe.recipeSearchByMenu", searchKey);
	}

	@Override
	public List<String> selectMenuSubCtg(String mainCtg) {
		return sqlSession.selectList("recipe.selectMenuSubCtg", mainCtg);
	}


	
}

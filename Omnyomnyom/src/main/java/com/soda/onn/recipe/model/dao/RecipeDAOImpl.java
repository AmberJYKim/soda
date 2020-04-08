package com.soda.onn.recipe.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;
import com.soda.onn.recipe.model.vo.RecipeWithIngCnt;

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
	public List<String> selectMenuSubCtg() {
		return sqlSession.selectList("recipe.selectMenuSubCtg");
	}


	
	
}

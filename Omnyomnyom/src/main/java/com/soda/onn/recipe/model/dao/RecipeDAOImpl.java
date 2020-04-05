package com.soda.onn.recipe.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mall.model.vo.Ingredient;
import com.soda.onn.recipe.model.vo.Recipe;
import com.soda.onn.recipe.model.vo.RecipeIngredient;

@Repository
public class RecipeDAOImpl  implements RecipeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Ingredient> ingredientAjax(String ingr) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return sqlSession.insert("recipe.recipeUpload", recipe);
	}

	@Override
	public int recipeIngrUpload(RecipeIngredient ingr) {
		return sqlSession.insert("recipe.recipeIngrUpload", ingr);
	}

	
	
}

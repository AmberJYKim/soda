package com.soda.onn.recipe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAOImpl  implements RecipeDAO{
	
	@Autowired SqlSessionTemplate sqlSession;

	@Override
	public List<String> selectIngSubCtg(String mainCtg) {
		return sqlSession.selectList("recipe.selectIngSubCtg", mainCtg);
	}
	
	
}

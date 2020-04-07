package com.soda.onn.chef.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.recipe.model.vo.Recipe;

@Repository
public class ChefDAOImpl implements ChefDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Chef> selectChefAllList() {
		
		return sqlSession.selectList("chef.selectChefAllList");
	}
	@Override
	public List<ChefRequest> selectChefRequestList(RowBounds rowBounds) {
		return sqlSession.selectList("chef.selectChefRequestList", null, rowBounds);
	}

	@Override
	public ChefRequest selectChefRequest(String memberId) {
		return sqlSession.selectOne("chef.selectChefRequest", memberId);
	}

	@Override
	public int selectChefRequestListCnt() {
		return Integer.parseInt(sqlSession.selectOne("chef.selectChefRequestListCnt"));
	}

	@Override
	public int chefReuqest(ChefRequest chefRequest) {
		return sqlSession.insert("chef.chefRequest",chefRequest);
	}
	@Override
	public List<Chef> chefSearch(String chefsearchbar) {
		return sqlSession.selectList("chef.chefSearch", chefsearchbar);
	}
	@Override
	public Chef chefSelectOne(String chefNickName) {
		return sqlSession.selectOne("chef.chefSelectOne",chefNickName);
	}

	@Override
	public int chefRequestUpdate(Map<String, String> chefReq) {
		return sqlSession.update("chef.chefRequestUpdate", chefReq);
	}
	
	@Override
	public List<Recipe> recipeSelectAll(String chefNickName) {
		return sqlSession.selectList("chef.recipeSelectAll", chefNickName );
	}

}

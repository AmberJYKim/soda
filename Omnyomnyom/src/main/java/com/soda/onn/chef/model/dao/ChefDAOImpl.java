package com.soda.onn.chef.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;

@Repository
public class ChefDAOImpl implements ChefDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Chef> selectChefList() {
		return sqlSession.selectList("chef.selectChefList");
	}

	@Override
	public List<ChefRequest> selectChefRequestList() {
		return sqlSession.selectList("chef.selectChefRequestList");
	}

	@Override
	public ChefRequest selectChefRequest(String memberId) {
		return sqlSession.selectOne("chef.selectChefRequest", memberId);
	}

}

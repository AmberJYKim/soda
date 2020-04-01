package com.soda.onn.chef.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;

@Repository
public class ChefDAOImpl implements ChefDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Chef> selectChefList() {
		return sqlSession.selectList("chef.selectChefList");
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

}

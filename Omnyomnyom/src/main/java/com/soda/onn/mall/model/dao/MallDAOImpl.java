package com.soda.onn.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;

@Repository
public class MallDAOImpl implements MallDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<IngredientMall> selectIngredientList(RowBounds rowBounds) {
		return sqlSession.selectList("mall.selectIngredientList", rowBounds);
	}

	@Override
	public List<BuyHistory> selectBuyList(String memberId) {
		return sqlSession.selectList("mall.selectBuyList", memberId);
	}

}

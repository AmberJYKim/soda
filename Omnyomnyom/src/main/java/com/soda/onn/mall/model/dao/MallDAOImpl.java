package com.soda.onn.mall.model.dao;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mall.model.vo.Cart;

@Repository
public class MallDAOImpl implements MallDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<IngredientMall> selectIngredientList(String column) {
		return sqlSession.selectList("mall.selectIngredientList", column);
	}

	@Override
	public List<BuyHistory> selectBuyList(String memberId) {
		return sqlSession.selectList("mall.selectBuyList", memberId);
	}

	@Override
	public int selectBuyHistoryListCnt() {
		return Integer.parseInt(sqlSession.selectOne("mall.selectBuyHistoryListCnt"));
	}

	@Override
	public List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds) {
		return sqlSession.selectList("mall.selectBuyHistoryList",null, rowBounds);
	}

	@Override
	public IngredientMall selectIngMallOne(int ingMallNo) {
		return sqlSession.selectOne("mall.selectIngMallOne",ingMallNo);
		}


	@Override
	public int insertCart(Cart sb) {
		return sqlSession.insert("mall.insertCart", sb);
	}

	@Override
	public List<Cart> selectCartList(String memberId) {
		return sqlSession.selectList("mall.selectCartList",memberId);
	}

	@Override
	public List<IngredientMall> selectIngMallSearch(String keyword) {
		return sqlSession.selectList("mall.selectIngMallSearch", keyword);
	}

	@Override
	public int deleteCart(Cart sb) {
		return sqlSession.delete("mall.deleteCart", sb);
	}
	
	@Override
	public Cart selectCart(Cart sb) {
		return sqlSession.selectOne("mall.selectCart",sb);
	}

	@Override
	public int updateCart(Cart sb) {
		return sqlSession.update("mall.updateCart",sb);
	}
	
	

	

}

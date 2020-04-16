package com.soda.onn.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<IngredientMall> selectIngredientList(String subCtg) {
		return sqlSession.selectList("mall.selectIngredientList", subCtg);
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
	public int updateIngMall(List<Map<String,String>> list) {
		return sqlSession.update("mall.updateIngMall", list); 
	}


	@Override
	public List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds) {
		return sqlSession.selectList("mall.selectBuyHistoryList",null, rowBounds);
	}

	@Override
	public IngredientMall selectIngMallOne(int ingredientNo) {
		return sqlSession.selectOne("mall.selectIngMallOne",ingredientNo);
		}

	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("mall.insertCart", cart);
	}
	
	@Override
	public Cart selectCart(Cart cart) {
		return sqlSession.selectOne("mall.selectCart",cart);
	}
	
	@Override
	public int updateCart(Cart cart) {
		return sqlSession.update("mall.updateCart",cart);
	}
	
	@Override
	public int deleteCart(Cart cart) {
		return sqlSession.delete("mall.deleteCart", cart);
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
	public List<BuyHistory> selectAdminBuyList(String memberId) {
		return sqlSession.selectList("mall.selectAdminBuyList", memberId);
	}

	@Override
	public int ingredientInsert(IngredientMall ingredientMall) {
		
		return sqlSession.insert("mall.ingredientInsert",ingredientMall);
	}

	@Override
	public String prCategory(String pr) {
		return sqlSession.selectOne("mall.prCategory", pr);
	}

	@Override
	public String crCategory(String cr) {
		return sqlSession.selectOne("mall.crCategory",cr);
	}

}

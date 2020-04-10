package com.soda.onn.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mall.model.vo.Cart;

public interface MallDAO {

	List<IngredientMall> selectIngredientList(String column);

	List<BuyHistory> selectBuyList(String memberId);

	int selectBuyHistoryListCnt();

	List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds);

	IngredientMall selectIngMallOne(int ingMallNo);

	int insertCart(Cart sb);

	List<Cart> selectCartList(String memberId);

	List<IngredientMall> selectIngMallSearch(String keyword);

	int deleteCart(Cart sb);
	
	Cart selectCart(Cart sb);

	int updateCart(Cart sb);
	


}

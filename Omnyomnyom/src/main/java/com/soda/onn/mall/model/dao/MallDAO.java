package com.soda.onn.mall.model.dao;

import java.util.List;
import java.util.Map;

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

	List<Cart> selectCartList(String memberId);
	
	List<IngredientMall> selectIngMallSearch(String keyword);

	int insertCart(Cart cart);

	Cart selectCart(Cart cart);
	
	int updateCart(Cart cart);

	int deleteCart(Cart cart);

	List<BuyHistory> selectAdminBuyList(String memberId);

	int ingredientInsert(Map map);

	String prCategory(String pr);

	String crCategory(String cr);


}

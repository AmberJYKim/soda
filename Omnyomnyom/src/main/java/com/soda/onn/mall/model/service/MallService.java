package com.soda.onn.mall.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;
import com.soda.onn.mall.model.vo.Cart;

public interface MallService {

	List<IngredientMall> selectIngredientList(String column);

	List<BuyHistory> selectBuyList(String memberId);

	int selectBuyHistoryListCnt();

	List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds);

	IngredientMall selectIngMallOne(int ingMallNo);

	int insertCart(Cart cart);

	int deleteCart(Cart cart);

	List<Cart> selectCartList(String memberId);
	
	List<IngredientMall> selectIngMallSearch(String keyword);
	
	List<IngredientMall> selectCheckOutIng(List<Integer> ingredientNoList);

	List<IngredientMall> selectIngMallList(List<Map<String, String>> list);

	List<BuyHistory> selectAdminBuyList(String memberId);

	int ingredientInsert(Map map);

	String prCategory(String pr);

}

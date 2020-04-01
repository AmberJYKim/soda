package com.soda.onn.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;

public interface MallDAO {

	List<IngredientMall> selectIngredientList(String column);

	List<BuyHistory> selectBuyList(String memberId);

	int selectBuyHistoryListCnt();

	List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds);

}

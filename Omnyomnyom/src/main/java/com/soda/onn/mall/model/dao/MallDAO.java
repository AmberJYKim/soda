package com.soda.onn.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;

public interface MallDAO {

	List<IngredientMall> selectIngredientList(RowBounds rowBounds);

	List<BuyHistory> selectBuyList(String memberId);

}

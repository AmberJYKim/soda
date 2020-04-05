package com.soda.onn.mall.model.service;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mall.model.dao.MallDAO;
import com.soda.onn.mall.model.dao.MallDAOImpl;
import com.soda.onn.mall.model.vo.BuyHistory;
import com.soda.onn.mall.model.vo.IngredientMall;

@Service
public class MallServiceImpl implements MallService {

	@Autowired
	private MallDAO mallDAO;
	
	@Override
	public List<IngredientMall> selectIngredientList(String column) {
		return mallDAO.selectIngredientList(column);
	}

	@Override
	public List<BuyHistory> selectBuyList(String memberId) {
		return mallDAO.selectBuyList(memberId);
	}

	@Override
	public int selectBuyHistoryListCnt() {
		return mallDAO.selectBuyHistoryListCnt();
	}

	@Override
	public List<BuyHistory> selectBuyHistoryList(RowBounds rowBounds) {
		return mallDAO.selectBuyHistoryList(rowBounds);
	}

	@Override
	public IngredientMall selectIngMallOne(int ingredientNo) {
		return mallDAO.selectIngMallOne(ingredientNo);
	}

}

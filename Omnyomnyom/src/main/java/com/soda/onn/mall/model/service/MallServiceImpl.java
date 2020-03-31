package com.soda.onn.mall.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mall.model.dao.MallDAO;
import com.soda.onn.mall.model.vo.IngredientMall;

@Service
public class MallServiceImpl implements MallService {

	@Autowired
	private MallDAO mallDAO;
	
	@Override
	public List<IngredientMall> selectIngredientList(RowBounds rowBounds) {
		return mallDAO.selectIngredientList(rowBounds);
	}

	
}

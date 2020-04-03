package com.soda.onn.chef.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.chef.model.dao.ChefDAO;
import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;

@Service
public class ChefServiceImpl implements ChefService {

	
	@Autowired
	private ChefDAO chefDAO;
	
	@Override
	public List<Chef> selectChefAllList() {
		return chefDAO.selectChefAllList();
	}

	@Override
	public List<ChefRequest> selectChefRequestList(RowBounds rowBounds) {
		return chefDAO.selectChefRequestList(rowBounds);
	}

	@Override
	public ChefRequest selectChefRequest(String memberId) {
		return chefDAO.selectChefRequest(memberId);
	}

	@Override
	public int selectChefRequestListCnt() {
		return chefDAO.selectChefRequestListCnt();
	}

	@Override
	public int chefRequest(ChefRequest chefRequest) {
		
		return chefDAO.chefReuqest(chefRequest);
	}

	

	
}

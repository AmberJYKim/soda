package com.soda.onn.chef.model.service;

import java.util.List;

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
	public List<Chef> selectChefList() {
		return chefDAO.selectChefList();
	}

	@Override
	public List<ChefRequest> selectChefRequestList() {
		return chefDAO.selectChefRequestList();
	}

	@Override
	public ChefRequest selectChefRequest(String memberId) {
		return chefDAO.selectChefRequest(memberId);
	}

	
}

package com.soda.onn.chef.model.service;

import java.util.List;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;

public interface ChefService {

	List<Chef> selectChefList();

	List<ChefRequest> selectChefRequestList();

	ChefRequest selectChefRequest(String memberId);


}

package com.soda.onn.chef.model.dao;

import java.util.List;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;

public interface ChefDAO {

	List<Chef> selectChefList();

	List<ChefRequest> selectChefRequestList();

}

package com.soda.onn.chef.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.chef.model.vo.Chef;
import com.soda.onn.chef.model.vo.ChefRequest;
import com.soda.onn.recipe.model.vo.Recipe;

public interface ChefService {

	List<Chef> selectChefAllList();

	List<ChefRequest> selectChefRequestList(RowBounds rowBounds);

	ChefRequest selectChefRequest(String memberId);

	int selectChefRequestListCnt();

	int chefRequest(ChefRequest chefRequest);

	List<Chef> chefSearch(String chefsearchbar);

	Chef chefSelectOne(String chefNickName);
	
    int chefRequestUpdate(Map<String, String> chefReq);

    List<Recipe> recipeSelectAll(String chefNickName);

}

package com.soda.onn.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mypage.model.vo.DingDong;
import com.soda.onn.mypage.model.vo.Scrap;

public interface MypageService {

	List<Scrap> selectScrapList(String memberId, RowBounds rowBounds);

	int deleteScrap(int recipeNo);

	int updateScrap(Scrap scrap);

	List<DingDong> selectDingList(String memberId);



}

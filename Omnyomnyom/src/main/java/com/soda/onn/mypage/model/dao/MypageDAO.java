package com.soda.onn.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.mypage.model.vo.DingDong;
import com.soda.onn.mypage.model.vo.Scrap;

public interface MypageDAO {

	List<Scrap> selectScrapList(String memberId, RowBounds rowBounds);

	int deleteScrap(int recipeNo);

	int updateScrap(Scrap scrap);

	List<DingDong> selectDingList(String memberId);

	int insertPayDing(DingDong dd);


}

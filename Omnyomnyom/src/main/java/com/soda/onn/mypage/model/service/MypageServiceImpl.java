package com.soda.onn.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mypage.model.dao.MypageDAO;
import com.soda.onn.mypage.model.vo.DingDong;
import com.soda.onn.mypage.model.vo.Scrap;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public List<Scrap> selectScrapList(String memberId, RowBounds rowBounds) {
		return mypageDAO.selectScrapList(memberId, rowBounds);
	}

	@Override
	public int deleteScrap(int recipeNo) {
		return mypageDAO.deleteScrap(recipeNo);
	}

	@Override
	public int updateScrap(Scrap scrap) {
		return mypageDAO.updateScrap(scrap);
	}

	@Override
	public List<DingDong> selectDingList(Map<String, String> map) {

		 return mypageDAO.selectDingList(map);
	}
}

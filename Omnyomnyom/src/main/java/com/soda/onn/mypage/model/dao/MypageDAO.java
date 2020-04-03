package com.soda.onn.mypage.model.dao;

import java.util.List;

import com.soda.onn.mypage.model.vo.Scrap;

public interface MypageDAO {

	List<Scrap> selectScrapList(String memberId);

}

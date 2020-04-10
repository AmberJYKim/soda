package com.soda.onn.mypage.model.service;

import java.util.List;

import com.soda.onn.mypage.model.vo.Scrap;

public interface MypageService {

	List<Scrap> selectScrapList(String memberId);

}

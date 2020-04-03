package com.soda.onn.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.mypage.model.dao.MypageDAO;
import com.soda.onn.mypage.model.vo.Scrap;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public List<Scrap> selectScrapList(String memberId) {
		return mypageDAO.selectScrapList(memberId);
	}

}

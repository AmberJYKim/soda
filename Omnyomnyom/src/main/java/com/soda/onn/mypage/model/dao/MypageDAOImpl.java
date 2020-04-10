package com.soda.onn.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mypage.model.vo.Scrap;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Scrap> selectScrapList(String memberId) {
		return sqlSession.selectList("mypage.selectScrapList", memberId);
	}

}

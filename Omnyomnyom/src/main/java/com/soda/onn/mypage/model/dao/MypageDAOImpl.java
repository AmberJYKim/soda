package com.soda.onn.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.mypage.model.vo.DingDong;
import com.soda.onn.mypage.model.vo.Scrap;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Scrap> selectScrapList(String memberId, RowBounds rowBounds) {
		return sqlSession.selectList("mypage.selectScrapList", memberId, rowBounds);
	}

	@Override
	public int deleteScrap(int recipeNo) {
		return sqlSession.delete("mypage.deleteScrap", recipeNo);
	}

	@Override
	public int updateScrap(Scrap scrap) {
		return sqlSession.update("mypage.updateScrap", scrap);
	}

	@Override
	public List<DingDong> selectDingList(String memberId) {
		return sqlSession.selectList("mypage.selectDingList", memberId);
	}


}

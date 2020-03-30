package com.soda.onn.oneday.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.Reservation;

@Repository
public class OnedayDAOImpl implements OnedayDAO{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int deleteOneday(int onedayNo) {
		return sqlSession.delete("oneday.deleteOneday", onedayNo);
	}

	@Override
	public int insertOneday(Oneday oneday) {
		return sqlSession.insert("oneday.insertOneday", oneday);
	}

	@Override
	public Oneday selectOne(int onedayNo) {
		return sqlSession.selectOne("oneday.selectOne", onedayNo);
	}

	@Override
	public List<Reservation> selectReservationList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("oneday.selectReservationList", null, rowBounds);
	}


}

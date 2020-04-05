package com.soda.onn.oneday.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.OnedayTime;
import com.soda.onn.oneday.model.vo.Reservation;

@Repository
public class OnedayDAOImpl implements OnedayDAO{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int deleteOneday(int onedayclassNo) {
		return sqlSession.delete("oneday.deleteOneday", onedayclassNo);
	}

	@Override
	public int insertOneday(Oneday oneday) {
		return sqlSession.insert("oneday.insertOneday", oneday);
	}
	@Override
	public int insertTime(OnedayTime onedayTime) {
		// TODO Auto-generated method stub
		return sqlSession.insert("oneday.insertTime", onedayTime);
	}
	
	@Override
	public Oneday selectOne(int onedayclassNo) {
		return sqlSession.selectOne("oneday.selectOne", onedayclassNo);
	}

	@Override
	public List<Reservation> selectReservationList(String memberId, RowBounds rowBounds) {
		return sqlSession.selectList("oneday.selectReservationList", memberId, rowBounds);
	}

	@Override
	public List<OnedayReview> selectOnedayReviewList(RowBounds rowBounds) {
		return sqlSession.selectList("oneday.selectOnedayReviewList", null, rowBounds);
	}

	@Override
	public List<Oneday> selectDateList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneday.selectDateList");
	}

	@Override
	public List<OnedayTime> selectTimeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneday.selectTimeList");
	}
	@Override
	public List<OnedayTime> selectTimeOne(int onedayclassNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneday.selectTimeOne", onedayclassNo);
	}



}

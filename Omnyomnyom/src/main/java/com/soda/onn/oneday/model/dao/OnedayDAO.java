package com.soda.onn.oneday.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.OnedayTime;
import com.soda.onn.oneday.model.vo.Reservation;

public interface OnedayDAO {

	int deleteOneday(int onedayclassNo);

	int insertOneday(Oneday oneday);

	int insertTime(OnedayTime onedayTime);

	Oneday selectOne(int onedayclassNo);

	List<Reservation> selectReservationList(String memberId, RowBounds rowBounds);

	List<OnedayReview> selectOnedayReviewList(RowBounds rowBounds);

	List<Oneday> selectDateList();

	List<OnedayTime> selectTimeList();

	List<OnedayTime> selectTimeOne(int onedayclassNo);


}

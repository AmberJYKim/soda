package com.soda.onn.oneday.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.OnedayTime;

import com.soda.onn.oneday.model.vo.Reservation;

public interface OnedayService {

	int deleteOneday(int onedayclassNo);

	int insertOneday(Oneday oneday, List<String> otiList);

	Oneday selectOne(int onedayclassNo);

	List<Reservation> selectReservationList(String memberId, RowBounds rowBounds);

	List<OnedayReview> selectOnedayReviewList(RowBounds rowBounds);

//	List<Oneday> selectDateList(String detailedAddr, String onedayName);


	List<Oneday> selectDateList(Map<String, String> sec);

	List<OnedayTime> selectTimeList(int onedayclassNo);

}

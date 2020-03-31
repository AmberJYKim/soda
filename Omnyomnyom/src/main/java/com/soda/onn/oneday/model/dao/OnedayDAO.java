package com.soda.onn.oneday.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.Reservation;

public interface OnedayDAO {

	int deleteOneday(int onedayNo);

	int insertOneday(Oneday oneday);

	Oneday selectOne(int onedayNo);

	List<Reservation> selectReservationList(RowBounds rowBounds);

	List<OnedayReview> selectOnedayReviewList(RowBounds rowBounds);

}

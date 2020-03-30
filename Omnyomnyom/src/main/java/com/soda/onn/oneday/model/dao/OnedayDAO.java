package com.soda.onn.oneday.model.dao;

import java.util.List;

import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.Reservation;

public interface OnedayDAO {

	int deleteOneday(int onedayNo);

	int insertOneday(Oneday oneday);

	Oneday selectOne(int onedayNo);

	List<Reservation> selectReservationList(int cPage, int numPerPage);

}

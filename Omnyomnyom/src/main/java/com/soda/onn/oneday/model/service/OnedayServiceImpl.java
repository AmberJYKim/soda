package com.soda.onn.oneday.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.oneday.model.dao.OnedayDAO;
import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.Reservation;

@Service
public class OnedayServiceImpl implements OnedayService {

	@Autowired
	private OnedayDAO onedayDAO;

	@Override
	public int deleteOneday(int onedayNo) {
		return onedayDAO.deleteOneday(onedayNo);
	}

	@Override
	public int insertOneday(Oneday oneday) {
		return onedayDAO.insertOneday(oneday);
	}

	@Override
	public Oneday selectOne(int onedayNo) {
		return onedayDAO.selectOne(onedayNo);
	}


	@Override
	public List<Reservation> selectReservationList(int cPage, int numPerPage) {
		return onedayDAO.selectReservationList(cPage,numPerPage);
	}
	
	
	
}

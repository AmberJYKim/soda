package com.soda.onn.oneday.model.service;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.session.RowBounds;
import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soda.onn.oneday.model.dao.OnedayDAO;
import com.soda.onn.oneday.model.vo.Oneday;
import com.soda.onn.oneday.model.vo.OnedayReview;
import com.soda.onn.oneday.model.vo.OnedayTime;

import com.soda.onn.oneday.model.vo.Reservation;

@Service
public class OnedayServiceImpl implements OnedayService {

	@Autowired
	private OnedayDAO onedayDAO;

	@Override
	public int deleteOneday(int onedayclassNo) {
		return onedayDAO.deleteOneday(onedayclassNo);
	}
	
	
	@Override
	public int insertOneday(Oneday oneday,  List<OnedayTime> otiList) {
		
		int result = onedayDAO.insertOneday(oneday);

		if(result>0)
			for(OnedayTime onedayTime:otiList) {
				onedayTime.setOnedayNoo(oneday.getOnedayclassNo());
				
				Log.debug("원데이클래스 no = " + onedayTime);
				onedayDAO.insertTime(onedayTime);
			}
		
		return result;
	}
	
	@Override
	public Oneday selectOne(int onedayclassNo) {
		return onedayDAO.selectOne(onedayclassNo);
	}


	@Override
	public List<Reservation> selectReservationList(String memberId, RowBounds rowBounds) {
		return onedayDAO.selectReservationList(memberId, rowBounds);
	}

	@Override
	public List<OnedayReview> selectOnedayReviewList(RowBounds rowBounds) {
		return onedayDAO.selectOnedayReviewList(rowBounds);
	}


	@Override
	public List<Oneday> selectDateList() {
		List<Oneday> list = onedayDAO.selectDateList(); // 54
		
		for (Oneday one : list) {
			one.setOnedayTimeList(onedayDAO.selectTimeOne(one.getOnedayclassNo()));
////			원데이 클래스의 넘버를 매개변수로하는  OnedayTime을 selectOne하는 것.
////			거기에서 불러온 값을 Oenday의 private List<OnedayTime> onedayTimeList;에 담음.
		
		}
	
		return list;
		
	}


	@Override
	public List<OnedayTime> selectTimeList() {
		
		return onedayDAO.selectTimeList();
	}



	
	
}

package com.soda.onn.oneday.model.service;

import com.soda.onn.oneday.model.vo.Oneday;

public interface OnedayService {

	int deleteOneday(int onedayNo);

	int insertOneday(Oneday oneday);

	Oneday selectOne(int onedayNo);

}

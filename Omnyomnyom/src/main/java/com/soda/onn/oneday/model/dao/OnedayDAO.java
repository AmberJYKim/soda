package com.soda.onn.oneday.model.dao;

import com.soda.onn.oneday.model.vo.Oneday;

public interface OnedayDAO {

	int deleteOneday(int onedayNo);

	int insertOneday(Oneday oneday);

	Oneday selectOne(int onedayNo);

}

package com.soda.onn.oneday.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OnedayTime implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int onedayTimeNo;
	private int onedayNoo;
	private Oneday oneday; //예약할때 사용.
	private Date onedayTimeDate; // 3 , 2 ,1 ,5 
	/* private int onedayTimeHour; */
}
//DEBUG: com.soda.onn.oneday.controller.OnedayController - sss={}04/08/2020 05:10 pm


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
	private Oneday oneday;
	private Date onedayTimeDate;
	private int onedayTimeHour;
}

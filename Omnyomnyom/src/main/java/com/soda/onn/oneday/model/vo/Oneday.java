package com.soda.onn.oneday.model.vo;

import java.io.Serializable;
import java.util.List;

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
public class Oneday  implements Serializable{
	 
	private static final long serialVersionUID = 1L;

	private int onedayNo;
	private String onedayName;
	private List<String> menuList;
	private int price;
	private String onedayContent;
	private int latitude;
	private int longitude;
	private int onedayTime;
	private int onedayMaxper;
	private int onedayMinper;
	private String onedayImg;
	
	private List<OnedayTime> onedayTimeList; 
	
}

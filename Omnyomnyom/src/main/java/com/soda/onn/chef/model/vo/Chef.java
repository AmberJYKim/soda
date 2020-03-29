package com.soda.onn.chef.model.vo;

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
public class Chef implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String chefProfile;
	private String chefSns;
	private String chefContent;
	private String chefMainvideo;
	private String businessInfo;
	private String menyPrCategory;
	private Date regDate;
}

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
	private String chefMainvideo;
	private String chefSns;
	private String chefProfile;
	private String ChefCategory;
	private Date regDate;
	private String businessInfo;
	private String chefContent;
	
}

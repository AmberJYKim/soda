package com.soda.onn.chef.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.soda.onn.member.model.vo.Member;

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
public class Chef extends Member implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String chefMainvideo;
	private String chefSns;
	private String chefProfile;
	private String menuPrCategory;
	private Date chefRegDate;
	private String businessInfo;
	private String chefContent;
	
	public Chef(String memberId, String memberPwd, String memberNick, String memberName, String phone, String email,
			String ssn, String memberRoll, Date regDate, String address, String chefMainvideo, String chefSns,
			String chefProfile, String menuPrCategory, Date chefRegDate, String businessInfo, String chefContent) {
		super(memberId, memberPwd, memberNick, memberName, phone, email, ssn, memberRoll, regDate, address);
		this.chefMainvideo = chefMainvideo;
		this.chefSns = chefSns;
		this.chefProfile = chefProfile;
		this.menuPrCategory = menuPrCategory;
		this.chefRegDate = chefRegDate;
		this.businessInfo = businessInfo;
		this.chefContent = chefContent;
	}
}

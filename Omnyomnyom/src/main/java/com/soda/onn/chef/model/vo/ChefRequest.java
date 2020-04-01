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
public class ChefRequest extends Chef implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Date reqDate;
	private String chefReqOk;
	private String chefReqVideo;
	private String memberName;
	private String memberNick;
	private String email;
	private String phone;
	
	public ChefRequest(String memberId, String chefMainvideo, String chefSns, String chefProfile, String menyPrCategory,
			Date regDate, String businessInfo, String chefContent, Date reqDate, String chefReqOk, String chefReqVideo,
			String memberName, String memberNick, String email, String phone) {
		super(memberId, chefMainvideo, chefSns, chefProfile, menyPrCategory, regDate, businessInfo, chefContent);
		this.reqDate = reqDate;
		this.chefReqOk = chefReqOk;
		this.chefReqVideo = chefReqVideo;
		this.memberName = memberName;
		this.memberNick = memberNick;
		this.email = email;
		this.phone = phone;
	}
}

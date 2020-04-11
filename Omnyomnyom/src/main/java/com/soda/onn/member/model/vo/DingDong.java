package com.soda.onn.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DingDong implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int dongdongNo;
	private String dingMemberId;
	private String dingdongContent;
	private String dingdongLink;
	private int dingdongRead;
	private Date dingRegDate;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}

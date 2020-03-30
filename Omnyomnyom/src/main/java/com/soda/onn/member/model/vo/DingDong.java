package com.soda.onn.member.model.vo;

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
public class DingDong implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String dingdongContent;
	private String dingdongLink;
	private int dingdongRead;
	private Date regDate;
}

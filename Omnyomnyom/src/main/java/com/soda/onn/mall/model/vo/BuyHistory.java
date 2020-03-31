package com.soda.onn.mall.model.vo;

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
public class BuyHistory implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int buyNo;
	private String memberId;
	private int totalPrice;
	private Date regDate;
	private String buyStatus;
}

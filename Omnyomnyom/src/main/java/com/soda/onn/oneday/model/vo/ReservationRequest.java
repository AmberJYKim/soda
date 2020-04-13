package com.soda.onn.oneday.model.vo;

import java.io.Serializable;

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
public class ReservationRequest extends Reservation implements Serializable {
	private String memberId;
	private int onedayclassNo;
	private int onedaytimeNo;
	private String onedayClassName;
	private int totalPrice;
	private int price;
	
	
	public ReservationRequest(int reservationNo, String reserMemberId, Oneday oneday, String regDate, int personnel,
			String cancel, int resPrice, String memberId, int onedayclassNo, int onedaytimeNo) {
		super(reservationNo, reserMemberId, oneday, regDate, personnel, cancel, resPrice);
		this.memberId = memberId;
		this.onedayclassNo = onedayclassNo;
		this.onedaytimeNo = onedaytimeNo;
	}




	private static final long serialVersionUID = 1L;
}

package com.soda.onn.oneday.model.vo;

import java.io.Serializable;
import java.sql.Date;
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
public class OnedayReview implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int reviewNo;
	private int reservationNo;
	private String memberId;
//	private Oneday oneday;
//	private OnedayTime onedayTime;
	private String reviewContent;
	private String reviewImg;
	private Date regDate;
	private int reviewScore;
	private List<ReviewReply> reviewReplyList;
}

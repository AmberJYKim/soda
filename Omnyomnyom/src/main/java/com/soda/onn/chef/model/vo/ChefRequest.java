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
public class ChefRequest extends Chef implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Date reqDate;
	private String chefReqOk;
	private String chefReqVideo;
}

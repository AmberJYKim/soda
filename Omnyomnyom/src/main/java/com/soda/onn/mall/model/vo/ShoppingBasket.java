package com.soda.onn.mall.model.vo;

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
public class ShoppingBasket implements Serializable{
	private static final long serialVersionUID = 1L;

	private int ingredientNo;
	private List<IngredientMall> ingredientMall;
	private int stock;
	private Date regDate;
}

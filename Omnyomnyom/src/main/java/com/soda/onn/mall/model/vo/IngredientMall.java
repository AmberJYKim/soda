package com.soda.onn.mall.model.vo;

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
public class IngredientMall extends Ingredient implements Serializable {

	private static final long serialVersionUID = 1L;

	private int price;
	private int stock;
	private int minUnit;
	private String ingOrigin;
	private int shelfLife;
	private String ingInfo;

	public IngredientMall(int ingredientNo, String ingPrCategory, String ingCdCategory, String ingredientName,
			String ingFilename, int price, int stock, int minUnit, String ingOrigin, int shelfLife, String ingInfo) {
		super(ingredientNo, ingPrCategory, ingCdCategory, ingredientName, ingFilename);
		this.price = price;
		this.stock = stock;
		this.minUnit = minUnit;
		this.ingOrigin = ingOrigin;
		this.shelfLife = shelfLife;
		this.ingInfo = ingInfo;
	}
	
}

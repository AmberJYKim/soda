package com.soda.onn.recipe.model.vo;

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
public class Recipe implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int recipeNo;
	private String recipeId;
	private String recipeName;
	private String menuName;
	private String chefNick;
	private String chefId;
	private int cookingTime;
	private String category;
	private Date regDate;
	private int viewCount;
	private String recipeContent;
	private String timeline;
	private List<RecipeIngredient> ingredientList;
}

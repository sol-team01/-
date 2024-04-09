package com.hac.dto.searchDto;

import java.util.Date;

import lombok.Data;

@Data
public class MyFoodDto {
	private int foodNumber = 0;
	private String foodName; //음식이름
	private String servingAmount; // 용량
	private String calorie;	 // 칼로리
	private int intServingAmount;
	private double intCalorie;
	private Date Time; // 날짜 임시로 만들어둠 
}
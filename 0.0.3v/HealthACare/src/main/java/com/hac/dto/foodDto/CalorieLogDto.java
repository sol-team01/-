package com.hac.dto.foodDto;

import java.util.Date;

import lombok.Data;

@Data
public class CalorieLogDto {
	private String C_no;
	private String U_no;
	private String C_foodName;
	private int C_servingAmount;
	private double C_calorie;
	private int C_meal; // 아침 = 0, 점심 = 1, 저녁 = 2 , 간식 = 3
	private String C_createdAt; // 날짜 임시로 만들어둠 
	private String C_updatedAt; // 날짜 임시로 만들어둠 
}
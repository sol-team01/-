package com.hac.dto.foodDto;

import java.util.List;

import lombok.Data;

@Data
public class CalorieLogDtoList {
	private String U_no;
	private String date;
	private int C_meal;
	private String meal;
	private String foodJSON;
	private List<CalorieLogDto> foodList;
	private double sumCalorie;
}
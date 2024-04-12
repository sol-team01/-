package com.hac.service;

import java.util.List;

import com.hac.dto.foodDto.CalorieLogDtoList;
import com.hac.dto.foodDto.FoodDto;
import com.hac.dto.searchDto.MyFoodDtoList;

public interface FoodService {


	public void insertFoodList(MyFoodDtoList list);

	public FoodDto foodList(String descKor);
	
	public List<CalorieLogDtoList> calorieListDto(String U_no);
	
	
}

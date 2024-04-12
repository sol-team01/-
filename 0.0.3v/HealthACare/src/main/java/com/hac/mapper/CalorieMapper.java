package com.hac.mapper;

import java.util.List;

import com.hac.dto.foodDto.CalorieLogDtoList;
import com.hac.dto.searchDto.MyFoodDtoList;

public interface CalorieMapper {
	public void insertFoodList(MyFoodDtoList list);
	
	public List<CalorieLogDtoList> myCalorieLog(String U_no);
}

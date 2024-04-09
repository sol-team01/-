package com.hac.service;

import com.hac.dto.foodDto.FoodDto;
import com.hac.dto.searchDto.MyFoodDtoList;

public interface FoodService {


	public void insertFoodList(MyFoodDtoList list);

	public FoodDto foodList(String descKor);
}

package com.hac.service;

import java.util.List;

import com.hac.dto.searchDto.MyFoodDto;

public interface FoodService {

	public void addFood(MyFoodDto food);

	public void removeFood(int index);
	
	public List<MyFoodDto> getFood();
	
	public void insertFoodList();
	
	public void resetFood();
}

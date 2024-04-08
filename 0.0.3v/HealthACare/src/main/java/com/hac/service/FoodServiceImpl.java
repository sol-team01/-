package com.hac.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.MyFoodDto;
import com.hac.mapper.CalorieMapper;

import lombok.Setter;

@Service
public class FoodServiceImpl implements FoodService{

	
	@Setter(onMethod_ = @Autowired)
	private CalorieMapper mapper;	
	
	private List<MyFoodDto> foodList = new ArrayList<>();
	
	@Override
	public void addFood(MyFoodDto list) {
		list.setIntServingAmount(Integer.parseInt(list.getServingAmount()));
		list.setIntCalorie(Double.parseDouble(list.getCalorie()));
		foodList.add(list);
	}
	@Override
	public void removeFood(int index) {
		foodList.remove(index);
		
	}
	
	@Override
	public List<MyFoodDto> getFood(){
		return foodList;
	}
	
	@Override
	public void insertFoodList() {
		mapper.addFoodList(foodList);
		foodList = new ArrayList<>();
	 }
	
	@Override
	public void resetFood() {
		foodList = new ArrayList<>();
	}
	
	
}

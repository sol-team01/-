package com.hac.service.util;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hac.dto.foodDto.CalorieLogDto;

public class FoodEncoding {

	
	public static  List<CalorieLogDto> foodEncoding(String foodJson) {
		ObjectMapper objectMapper = new ObjectMapper();
		List<CalorieLogDto> list = null;
		try {
			list = objectMapper.readValue(foodJson, new TypeReference<List<CalorieLogDto>>() {});
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}

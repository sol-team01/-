package com.hac.dto.searchDto;

import java.util.List;

import lombok.Data;

@Data
public class MyFoodDtoList {

	private String U_no;
	private String meal;
	private List<MyFoodDto> list;
	
}

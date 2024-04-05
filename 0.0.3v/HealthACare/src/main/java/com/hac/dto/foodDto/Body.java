package com.hac.dto.foodDto;

import java.util.List;

import lombok.Data;
@Data
public class Body {

	private Integer pageNo;
	private Integer totalCount;
	private Integer numOfRows;
	private List<Item> items;

}

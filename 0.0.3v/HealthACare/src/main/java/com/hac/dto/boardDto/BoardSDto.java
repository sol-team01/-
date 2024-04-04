package com.hac.dto.boardDto;

import lombok.Data;

@Data
public class BoardSDto {
	private int limitIndex;
	private String word = "";
	private String column;
}

package com.hac.dto.boardDto;

import lombok.Data;

@Data
public class BoardDto {
	private Long b_NO;
	private Long u_NO;
	private String b_TITLE;
	private String b_TEXT;
	private String b_ID;
	private String b_DATETIME;
	private String b_CATEGORY;
	private int b_HIT;
	private int b_REPLY_COUNT;
	private int b_REPLY_ORI;
}

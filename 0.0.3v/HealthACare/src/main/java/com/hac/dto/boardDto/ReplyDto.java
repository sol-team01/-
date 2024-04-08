package com.hac.dto.boardDto;

import lombok.Data;

@Data
public class ReplyDto {
	private Long r_NO;
	private Long u_NO;
	private Long b_NO;
	private String r_TITLE;
	private String r_TEXT;
	private String r_ID;
	private String r_DATETIME;
	private int r_HIT;
}

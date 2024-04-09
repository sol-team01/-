package com.hac.dto.boardDto;

import lombok.Data;

@Data
public class BoardDto {
	private String B_no;
	private String U_no;
	private String B_title;
	private String B_text;
	private String I_name;
	private String B_datetime;
	private String B_category;
	private int B_hit;
	private int B_replyCount;
	private int B_replyOrI;
}

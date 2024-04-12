package com.hac.dto.boardDto;

import lombok.Data;

@Data
public class ReplyDto {
	private String R_no;
	private String U_no;
	private String B_no;
	private String R_title;
	private String R_text;
	private String I_name;
	private String R_datetime;
	private int R_hit;
}

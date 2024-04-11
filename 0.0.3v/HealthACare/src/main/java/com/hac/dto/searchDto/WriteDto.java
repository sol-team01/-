package com.hac.dto.searchDto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class WriteDto {
	
	private String U_no;
	private String I_name;
	private String B_category;
	private String B_title;
	private String B_text;
	private LocalDateTime registerDate;	
}

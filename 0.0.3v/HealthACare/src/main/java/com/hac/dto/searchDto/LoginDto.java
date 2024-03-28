package com.hac.dto.searchDto;

import lombok.Data;

@Data 
public class LoginDto {
	private int U_no;
	private String U_id = "";
	private String U_pw = "";
	private String I_name ="";
	private String I_email = "";
	private String I_hint = "";
}

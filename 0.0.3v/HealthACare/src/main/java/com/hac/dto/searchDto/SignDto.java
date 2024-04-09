package com.hac.dto.searchDto;

import lombok.Data;

@Data 
public class SignDto {
	private String U_no;
	private String U_id = "";
	private String U_pw = "";
	private String U_repw = ""; //비밀번호 확인 변수
	private String I_name ="";
	private String I_email = "";
	private String I_hint = "";
	private String email;
	private String domain;
	private String domainList;
}

package com.hac.dto.searchDto;

import lombok.Data;

@Data
public class MyPageDto {

	private String U_no;         // 유저 번호
	private String I_name;
	private String P_weight; // 키
	private String P_height; // 몸무게
	private String period = "day"; // 주(WEEK), 월(MONTH), 년(YEAR) 묶음 그래프 시간
	private byte[] I_profileImg; // 프로필 사진
}

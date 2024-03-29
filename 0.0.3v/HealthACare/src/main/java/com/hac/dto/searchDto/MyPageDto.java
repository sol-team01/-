package com.hac.dto.searchDto;

import lombok.Data;

@Data
public class MyPageDto {

	private String U_no;         // 유저 번호
	private String calumName;  // 확인할 칼럼 이름 updateTime 을 확인하기위해
	private String I_name; // 닉네임
	private byte[] I_profileImg; // 프로필 사진
	private String I_weight; // 몸무게
	private String I_height; // 키
	private String period = "day"; // 주(WEEK), 월(MONTH), 년(YEAR) 묶음
}

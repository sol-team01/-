package com.hac.dto.userDto;

import java.util.Date;

import lombok.Data;


@Data
public class InfoDto {

	private String I_no; // 인포Dto 고유번호
	private String U_no; // 유저 넘버
	private String I_name; // 유저 네임
	private Date I_nameUpdateTime; // 유저 이름 마지막 변경시간
	private byte[] I_profileImg; // 프로필 사진
	private Date I_profileImgUpdateTime; // 프로필 사진 마지막 변경시간
	private String I_birthDate_y; // 생년월일
	private String I_birthDate_m; // 생년월일
	private String I_birthDate_d; // 생년월일
	private String I_gender; // 성별
	private String I_email; // 이메일
	private String I_pwFinding; //질의 종류
	private String I_hint; // 질문 대답
	private Date I_createdAt; // 계정생성시간
	private Date I_updatedAt; // 마지막 업데이트 시간
	
}

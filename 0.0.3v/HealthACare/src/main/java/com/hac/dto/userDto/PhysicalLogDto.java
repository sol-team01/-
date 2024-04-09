package com.hac.dto.userDto;

import java.util.Date;

import lombok.Data;

@Data
public class PhysicalLogDto {

	private String P_no; // 키
	private String U_no; // 키
	private double P_weightLog; // 키
	private double P_heightLog; // 몸무게
	private Date P_createdAt;
	private Date P_updatedAt; // 마지막 업데이트 시간
	
	
}

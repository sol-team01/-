package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface PhysicalMapper {
	public ArrayList<PhysicalDto> getPhysical();
	public ArrayList<PhysicalLogDto> searchPhysical(String U_no);
	
	//마지막 몸무게, 키 입력날짜 확인
	public Integer physicalUpdateTime(String U_no);
	
	// 하루 이상 차이날경우 insert
	public void physical(@Param("U_no") String U_no,@Param("weight")String weight,@Param("height") String height);
	
	// 수정한 당일인경우 업데이트
	public void physicalUpdate(@Param("U_no") String U_no,@Param("weight")String weight,@Param("height") String height);
//	
//	
//	public void setterPhysical(@Param("U_no") String U_no,@Param("weight")String weight,@Param("height") String height);
	public PhysicalLogDto myPhysical(String U_no);
}

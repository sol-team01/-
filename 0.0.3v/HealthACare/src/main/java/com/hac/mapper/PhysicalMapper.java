package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface PhysicalMapper {
	public ArrayList<PhysicalDto> getPhysical();
	public ArrayList<PhysicalLogDto> searchPhysical(String U_no);
	public void setterPhysical(@Param("U_no") String U_no,@Param("weight")String weight,@Param("height") String height);
	public PhysicalDto myPhysical(String U_no);
	public void delPhysical(String U_no);
}

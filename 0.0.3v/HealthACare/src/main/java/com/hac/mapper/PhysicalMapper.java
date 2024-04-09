package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface PhysicalMapper {
	public ArrayList<PhysicalDto> getPhysical();
	public ArrayList<PhysicalLogDto> searchPhysical(String uno);
	public void setterPhysical(@Param("uno") String uno,@Param("weight")String weight,@Param("height") String height);
	public PhysicalDto myPhysical(long uno);
	public void delPhysical(long uno);
}

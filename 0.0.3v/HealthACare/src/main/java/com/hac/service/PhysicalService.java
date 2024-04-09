package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface PhysicalService {
	public ArrayList<PhysicalDto> getPhysical();
	public ArrayList<PhysicalLogDto> searchPhysical(String U_no);
	public void setterPhysical(String U_no,String weight,String height);

}

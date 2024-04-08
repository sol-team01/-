package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface PhysicalService {
	public ArrayList<PhysicalDto> getPhysical();
	public ArrayList<PhysicalLogDto> searchPhysical(String uno);
	public void setterPhysical(String uno,String weight,String height);
	public PhysicalDto myPhysical(long uno);
	public void delPhysical(long uno);
}

package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.userDto.PhysicalLogDto;
import com.hac.mapper.PhysicalMapper;

@Service
public class PhysicalServiceImpl implements PhysicalService {
	
	@Autowired
	private PhysicalMapper mapper;

	@Override
	public ArrayList<PhysicalDto> getPhysical(){
		return mapper.getPhysical();
	}
	

	@Override
	public ArrayList<PhysicalLogDto> searchPhysical(String U_no){
		System.out.println("서치 피지컬 통과" + U_no);
		return mapper.searchPhysical(U_no);
	}
	
	
	@Override
	public void setterPhysical(String U_no,	String weight,	String height) {
		
		Integer updateTime = mapper.physicalUpdateTime(U_no);
		if(updateTime == null || updateTime > 0) {
			mapper.physical(U_no,weight,height);
		} else {
			mapper.physicalUpdate(U_no,weight,height);
		}
	}
	
}

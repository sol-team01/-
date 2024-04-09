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
	public PhysicalDto myPhysical(long uno) {
		return mapper.myPhysical(uno);
	}
	
	@Override
	public ArrayList<PhysicalLogDto> searchPhysical(String uno){
//		PhysicalLogDto dto = new PhysicalLogDto();
//		dto.setU_no(uno);
		return mapper.searchPhysical(uno);
	}
	
	@Override
	public void delPhysical(long uno) {
		mapper.delPhysical(uno);
	}
	
	@Override
	public void setterPhysical(String uno,
			String weight,
			String height) {
		if (mapper != null) {
			mapper.setterPhysical(uno,weight,height);
		} else {
			System.out.println("null");
		}
	}
	
}

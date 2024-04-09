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
	public PhysicalDto myPhysical(String U_no) {
		return mapper.myPhysical(U_no);
	}
	
	@Override
	public ArrayList<PhysicalLogDto> searchPhysical(String U_no){
//		PhysicalLogDto dto = new PhysicalLogDto();
//		dto.setU_no(uno);
		System.out.println("서치 피지컬 통과" + U_no);
		return mapper.searchPhysical(U_no);
	}
	
	@Override
	public void delPhysical(String U_no) {
		mapper.delPhysical(U_no);
	}
	
	@Override
	public void setterPhysical(String U_no,
			String weight,
			String height) {
		if (mapper != null) {
			mapper.setterPhysical(U_no,weight,height);
		} else {
			System.out.println("null");
		}
	}
	
}

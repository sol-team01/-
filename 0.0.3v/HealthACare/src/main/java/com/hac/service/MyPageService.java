package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface MyPageService {
	
	public InfoDto myProfile(MyPageDto dto);
	
	public ArrayList<PhysicalLogDto> myPhysical(MyPageDto dto);

	public void nameChange(MyPageDto dto); 
	
	public void profileImgChange(MyPageDto dto);
	
	public String physical(MyPageDto dto);
	
	public byte[] getByteImg(String U_no);
}

package com.hac.service;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface MyPageService {
	
	public InfoDto myProfile(MyPageDto dto);
	
	public PhysicalLogDto myPhysical(MyPageDto dto);

	public void nameChange(MyPageDto dto); 
	
	public void emailChange(MyPageDto dto);
	
	public void pwFindingChange(MyPageDto dto);
	
	public String physical(MyPageDto dto);
	
	public void profileImgChange(MyPageDto dto);

	public byte[] getByteImg(String U_no);

}

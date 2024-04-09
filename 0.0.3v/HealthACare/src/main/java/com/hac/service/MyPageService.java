package com.hac.service;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface MyPageService {
	
	public InfoDto myProfile(MyPageDto dto);
	
	public PhysicalLogDto myPhysical(String U_no);

	public void nameChange(MyPageDto dto); 
	
	public void emailChange(MyPageDto dto);
	
	public void pwFindingChange(MyPageDto dto);
	
	public void profileImgChange(MyPageDto dto);

	public byte[] getByteImg(String U_no);
	
	public InfoDto getInfoDto(String U_no);

}

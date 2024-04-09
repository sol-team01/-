package com.hac.mapper;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface MyPageMapper {
	
	
	// 유저 프로필 불러오기
	public InfoDto myProfile(MyPageDto dto);
	
	// 유저 피지컬 정보(가장최신) 불러오기
	public PhysicalLogDto  myPhtsical(String U_no);
	
	public void nameChange(MyPageDto dto); 
	
	public void emailChange(MyPageDto dto);
	
	public void pwFindingChange(MyPageDto dto);
	
	//프로필 사진 변경
	public void profileImgChange(MyPageDto dto);

	public InfoDto getByteImg(String U_no);
	
}

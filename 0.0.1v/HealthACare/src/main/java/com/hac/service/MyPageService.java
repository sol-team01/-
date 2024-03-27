package com.hac.service;

import com.hac.dto.searchDto.MyPageDto;

public interface MyPageService {
	public boolean nameChange(MyPageDto dto); 
	
	public boolean profileImgChange(MyPageDto dto);
	
	public void physical(MyPageDto dto);
}

package com.hac.service;

import com.hac.dto.searchDto.MyPageDto;

public interface MyPageService {
	
	public boolean nameCount(String name);
	
	public boolean nameChange(MyPageDto dto); 
	
	public boolean profileImgChange(MyPageDto dto);
	
	public String physical(MyPageDto dto);
}

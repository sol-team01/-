package com.hac.mapper;

import java.util.ArrayList;

import com.hac.dto.searchDto.ThemeDto;

public interface ThemeMapper {
	
	public ArrayList<ThemeDto> themeList();
	public int themeHit(String T_no);
	
}
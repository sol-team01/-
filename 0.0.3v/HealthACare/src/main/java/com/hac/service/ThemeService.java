package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.ThemeDto;
public interface ThemeService {
	public ArrayList<ThemeDto> themeList();
	public int themeHit(String T_no);
}

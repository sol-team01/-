package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.ThemeDto;
import com.hac.mapper.ThemeMapper;

@Service
public class ThemeServiceImpl implements ThemeService {

	@Autowired
	private ThemeMapper mapper;
	
	public ArrayList<ThemeDto> themeList() {
		return mapper.themeList();
	}
	
	public int themeHit(String T_no) {
		return mapper.themeHit(T_no);
	}

}

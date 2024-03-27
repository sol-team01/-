package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.mapper.LoginMapper;
import com.hac.mapper.MyPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;	
	
	@Setter(onMethod_ = @Autowired)
	private LoginMapper loginMapper;	
	
	
	
	@Override
	public boolean nameChange(MyPageDto dto) {
		if(mapper.updateTime(dto) > 0) {
			mapper.nameChange(dto);
			return true;
		} else {
			
			return false;
		}
		
	}
	
	public boolean profileImgChange(MyPageDto dto) {
		if(mapper.updateTime(dto) > 0) {
			mapper.profileImgChange(dto); // 프로필 사진 변경 
			return true;
		} else {
			
			return false;
		}
		
		
	}
	
	public void physical(MyPageDto dto) {
		
		if(mapper.physicalUpdateTime(dto) > 0) {
			mapper.nameChange(dto);
		} else {
			mapper.physicalUpdate(dto);
		}
		
	}
	
}

package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.mapper.LoginMapper;
import com.hac.mapper.MyPageMapper;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;	
	
	@Setter(onMethod_ = @Autowired)
	private LoginMapper loginMapper;	
	
	@Override
	public boolean nameCount(String name) {
		if(loginMapper.countName(name) == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean nameChange(MyPageDto dto) {
		if(mapper.updateTime(dto) > 0) {
			mapper.nameChange(dto);
			return true;
		} else {
			
			return false;
		}
		
	}
	@Override
	public boolean profileImgChange(MyPageDto dto) {
		if(mapper.updateTime(dto) > 0) {
			mapper.profileImgChange(dto); // 프로필 사진 변경 
			return true;
		} else {
			
			return false;
		}
		
		
	}
	@Override
	public String physical(MyPageDto dto) {
		
		if(mapper.physicalUpdateTime(dto) > 0) {
			mapper.nameChange(dto);
			return "당일 신체정보를 입력하였습니다.";
		} else {
			mapper.physicalUpdate(dto);
			return "신체정보를 수정하였습니다.";
		}
		
	}
	
}

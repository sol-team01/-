package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;
import com.hac.mapper.MyPageMapper;
import com.hac.mapper.SignMapper;

import lombok.Setter;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;	
	
	@Setter(onMethod_ = @Autowired)
	private SignMapper SignMapper;	

	 // 프로필 정보 불러오기
	@Override 
	public InfoDto myProfile(MyPageDto dto) {
		InfoDto info = mapper.myProfile(dto);
		return info;
	}
	
	@Override
	// 가장최근 피지컬 정보 불러오기
	public PhysicalLogDto  myPhysical(MyPageDto dto) {
	
		return mapper.myPhtsical(dto);
	}
	

	@Override  // 닉네임 체인지
	public void nameChange(MyPageDto dto) {
			mapper.nameChange(dto);

	}
	
	@Override  // 신체정보 수정
	public String physical(MyPageDto dto) {
		
		if(mapper.physicalUpdateTime(dto) > 0) {
			mapper.nameChange(dto);
			return "당일 신체정보를 입력하였습니다.";
		} else {
			mapper.physicalUpdate(dto);
			return "신체정보를 수정하였습니다.";
		}
		
	}
	
	@Override //프로필사진 체인지
	public void profileImgChange(MyPageDto dto) {
		
		mapper.profileImgChange(dto); // 프로필 사진 변경 
	}
	
	@Override // 이미지 바이트불러오기
	public byte[] getByteImg(String U_no) {
		
		return mapper.getByteImg(U_no).getI_profileImg();
		
	}
	
}

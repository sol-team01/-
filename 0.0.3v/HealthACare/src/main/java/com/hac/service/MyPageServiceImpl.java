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
	private SignMapper signMapper;	

	 // 프로필 정보 불러오기
	@Override 
	public InfoDto myProfile(MyPageDto dto) {
		InfoDto info = mapper.myProfile(dto);
		return info;
	}
	
	@Override
	// 가장최근 피지컬 정보 불러오기
	public PhysicalLogDto  myPhysical(String U_no) {
	
		return mapper.myPhtsical(U_no);
	}
	

	@Override  // 닉네임 체인지
	public void nameChange(MyPageDto dto) {
			mapper.nameChange(dto);

	}
	
	@Override  //이메일 체인지
	public void emailChange(MyPageDto dto) {
		
	}
	@Override  // 비밀번호 찾기 질문 체인지
	public void pwFindingChange(MyPageDto dto) {
		
	}
	
	
	@Override //프로필사진 체인지
	public void profileImgChange(MyPageDto dto) {
		
		mapper.profileImgChange(dto); // 프로필 사진 변경 
	}
	
	@Override // 이미지 바이트불러오기
	public byte[] getByteImg(String U_no) {
		
		return mapper.getByteImg(U_no).getI_profileImg();
		
	}
	
	@Override
	public InfoDto getInfoDto(String U_no) {
		return signMapper.userInfo(U_no);
	}
	
}

package com.hac.mapper;

import java.util.ArrayList;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;

public interface MyPageMapper {
	
	
	// 유저 프로필 불러오기
	public InfoDto myProfile(MyPageDto dto);
	
	// 유저 피지컬 정보(가장최신) 불러오기
	public ArrayList<PhysicalLogDto>  myPhtsical(MyPageDto dto);
	
	//특정 항목의 업데이트 타임이 얼마나 되었는지 확인
	public int updateTime(MyPageDto dto);
	
	//닉네임 업데이트
	public void nameChange(MyPageDto dto);
	
	//프로필 사진 변경
	public void profileImgChange(MyPageDto dto);
	
	//마지막 몸무게, 키 입력날짜 확인
	public int physicalUpdateTime(MyPageDto dto);
	
	// 하루 이상 차이날경우 insert
	public void physical(MyPageDto dto);
	
	// 수정한 당일인경우 업데이트
	public void physicalUpdate(MyPageDto dto);

	public InfoDto getByteImg(String U_no);
	
}

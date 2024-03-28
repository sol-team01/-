package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.SignDto;

public interface SignMapper {
	public void signUp(SignDto dto);
	//암호화 구현 확인을 위한 함수
	public ArrayList<SignDto> loginList();
	//입력한 로그인을 불러오기 위한 메퍼
	public SignDto signIn(@Param("id") String id, @Param("pw") String pw);
}

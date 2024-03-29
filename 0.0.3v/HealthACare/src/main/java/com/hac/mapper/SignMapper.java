package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.SignDto;

public interface SignMapper {
	public void signUp(SignDto dto);
	//암호화 구현 확인을 위한 함수
	public ArrayList<SignDto> loginList();
	//입력한 로그인을 불러오기 위한 메퍼
	public SignDto signIn(@Param("U_id") String U_id, @Param("U_pw") String U_pw);
	//중복 아이디 검사(아이디 갯수)
	public int countId(@Param("U_id") String U_id);
}

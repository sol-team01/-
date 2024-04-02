package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;

public interface SignMapper {
	public void signUp(SignDto dto);
	//암호화 구현 확인을 위한 함수
	public ArrayList<SignDto> loginList();
	//입력한 로그인을 불러오기 위한 메퍼
	public SignDto signIn(@Param("U_id") String U_id, @Param("U_pw") String U_pw);
	//중복 아이디 검사(아이디 갯수)
	public boolean selectId(@Param("U_id") String U_id);
	//회원가입 개인 정보 매퍼
	public ArrayList<InfoDto> infoList();
	//회원가입 개인 정보 매퍼
	public void signUpInfo(InfoDto dto);
	//신체 정보
	public void signUpPhy(PhysicalDto dto);
	//피지컬 리스트
	public ArrayList<PhysicalDto> phyList();
	//유저 정보로 유저 넘버 가져오기
	public InfoDto noSearch(String U_id);
}
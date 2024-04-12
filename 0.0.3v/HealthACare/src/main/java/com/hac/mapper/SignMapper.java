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
	public SignDto signIn(@Param("U_id") String U_id);
	//중복 아이디 검사(아이디 갯수)
	public boolean selectId(@Param("U_id") String U_id);
	//중복 닉네임 검사
	public boolean selectName(@Param("I_name") String I_name);
	//이메일 중복 검사
	public boolean selectEmail(@Param("I_email") String I_email);
	//회원가입 개인 정보 매퍼
	public ArrayList<InfoDto> infoList();
	//회원가입 개인 정보 매퍼
	public InfoDto userInfo(String U_no);
	//회원가입 회원 정보
	public void signUpInfo(InfoDto dto);
	//회원가입 신체 정보
	public void signUpPhy(PhysicalDto dto);
	//피지컬 리스트
	public ArrayList<PhysicalDto> phyList();
	//유저 정보로 유저 넘버 가져오기
	public InfoDto noSearch(String U_id);
	//아이디 찾기
	public String searchId(String I_email);
	//비밀번호 찾기에 필요한 힌트 질문 찾기
	public InfoDto searchFinding(SignDto dto);
	//비밀번호 힌트 작성한거 비교
	public int searchPwHint(SignDto dto);
	//비밀번호 재설정
	public void pwChange(SignDto dto);
}
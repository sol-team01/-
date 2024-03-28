package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.SignDto;
import com.hac.mapper.SignMapper;

import lombok.Setter;

@Service
public class SignServiceImpl implements SignService {
	@Setter(onMethod_ = @Autowired)
	private SignMapper signMapper;
	
	private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	//암호화 해주는 함수
	@Override
	public String signUp(SignDto dto) {
		if(dto.getU_id() == null || dto.getU_id().trim().isEmpty()) {
			System.out.println("빈 ID 회원가입");
			return "redirect:/page/signUp"; //회원가입 폼으로 이동
		}
		
		if(dto.getU_pw() == null || dto.getU_pw().trim().isEmpty()) {
			System.out.println("빈 PW 회원가입");
			return "redirect:/page/signUp";
		}
		
		if(dto.getU_pw().length() < 8) {
			System.out.println("비밀번호 불일치 회원가입");
			return "redirect:/page/signUp";
		}
		
		if(!dto.getU_pw().equals(dto.getU_repw())) {
			System.out.println("비밀번호 확인 불일치 회원가입");
			return "redirect:/page/signUp";
		}
		
		if(signMapper.countId(dto.getU_id()) != 0) {
			System.out.println("아이디 중복 검사");
			return "redirect:/page/signUp";
		} else {
			dto.setU_pw(encoder.encode(dto.getU_pw()));
			signMapper.signUp(dto); //회원가입 진행
			return "redirect:/page/login";
		}
	}
	
	//암호화 확인해주는 함수
	@Override
	public ArrayList<SignDto> loginList() {
		return signMapper.loginList();
	}
	
	//로그인
	@Override
	public SignDto signIn(String id, String pw) {
		SignDto user = signMapper.signIn(id, pw);
//		if(user != null && encoder.matches(pw, user.getU_pw())) {
//			return user;
//		}
		return null;
	}
	
}

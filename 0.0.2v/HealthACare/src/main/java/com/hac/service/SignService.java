package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.LoginDto;
import com.hac.mapper.SignMapper;

@Service
public class SignService {
	@Autowired
	private SignMapper signMapper;
	
	private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	//암호화 해주는 함수
	public void login(LoginDto dto) {
		dto.setU_pw(encoder.encode(dto.getU_pw()));
		signMapper.login(dto);
	}
	
	//암호화 확인해주는 함수
	public ArrayList<LoginDto> loginList() {
		return signMapper.loginList();
	}
	
	//로그인
	public LoginDto signIn(String id, String pw) {
		LoginDto user = signMapper.signIn(id, pw);
		if(user != null && encoder.matches(pw, user.getU_pw())) {
			return user;
		}
		return null;
	}
}

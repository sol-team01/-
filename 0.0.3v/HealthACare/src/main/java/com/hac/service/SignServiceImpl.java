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
	public void signUp(SignDto dto) {
		dto.setU_pw(encoder.encode(dto.getU_pw()));
		signMapper.signUp(dto);
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
		if(user != null && encoder.matches(pw, user.getU_pw())) {
			return user;
		}
		return null;
	}
	
}

package com.hac.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hac.dto.searchDto.SignDto;

public interface SignService {
	public String signUp(SignDto dto);
	
	public ArrayList<SignDto> loginList();
	
	public SignDto signIn(String id, String pw);
}

package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.SignDto;

public interface SignService {
	public void signUp(SignDto dto);
	
	public ArrayList<SignDto> loginList();
	
	public SignDto signIn(String id, String pw);

}

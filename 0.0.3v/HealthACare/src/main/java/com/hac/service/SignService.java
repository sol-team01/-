package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.SignDto;

public interface SignService {
	public String signUp(SignDto dto);
	
	public ArrayList<SignDto> loginList();
	
	public SignDto signIn(String U_id, String U_pw);
	
	public boolean selectId(String U_id);
}

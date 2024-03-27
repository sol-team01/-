package com.hac.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.LoginDto;

public interface SignService {
	public void login(LoginDto dto);
	public ArrayList<LoginDto> LoginList();
	public LoginDto signIn(@Param("id") String id, @Param("pw") String pw);
}

package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.SignDto;
import com.hac.mapper.LoginMapper;

@Service
public class BasicService {

	@Autowired
	private LoginMapper mapper;
	
	
}

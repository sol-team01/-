package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;

public interface SignService {
	public String signUp(SignDto signdto,InfoDto infoDto, PhysicalDto phydto);
	
	public ArrayList<SignDto> loginList();
	
	public InfoDto signIn(String U_id, String U_pw);
	
	public boolean selectId(String U_id);
	
	public boolean selectName(String I_name);
	
	public void signUpInfo(InfoDto dto);
	
	public void signUpPhy(PhysicalDto dto);
	
	public String searchId(String I_email);
	
	public InfoDto searchFinding(SignDto dto);
	
	public SignDto searchPwHint(SignDto dto);
}

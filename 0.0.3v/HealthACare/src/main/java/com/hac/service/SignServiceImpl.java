package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.mapper.SignMapper;

import lombok.Setter;

@Service
public class SignServiceImpl implements SignService {
	@Setter(onMethod_ = @Autowired)
	private SignMapper signMapper;

	private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	

	// 암호화 해주는 함수
	@Override
	public String signUp(SignDto dto,InfoDto infoDto, PhysicalDto phyDto) {

		if (dto.getU_id() == null || dto.getU_id().trim().isEmpty()) {
			System.out.println("빈 ID 회원가입");
			return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		}

		if (dto.getU_pw() == null || dto.getU_pw().trim().isEmpty()) {
			System.out.println("빈 PW 회원가입");
			return "redirect:/page/signUp";
		}

		if (dto.getU_pw().length() < 8) {
			System.out.println("비밀번호 불일치 회원가입");
			return "redirect:/page/signUp";
		}

		if (!dto.getU_pw().equals(dto.getU_repw())) {
			System.out.println("비밀번호 확인 불일치 회원가입");
			return "redirect:/page/signUp";
		}

		if (signMapper.selectId(dto.getU_id())) {
		    System.out.println("아이디 중복 검사");
		    return "redirect:/page/signUp";
		
		} else {
			dto.setU_pw(encoder.encode(dto.getU_pw()));
			signMapper.signUp(dto); // 회원가입 진행
			
			infoDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			phyDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			signMapper.signUpInfo(infoDto);
			signMapper.signUpPhy(phyDto);
			
//			dto.setU_no(signMapper.signIn(dto.getU_id(),dto.getU_pw()).getU_no());
//			// 아이디 비번 인설트하고
//			
//			signMapper.signUpPhy(dto);
//			INSERT 하는 MAPPER에 DTO 값넣고
			// 아이디 비번 참조해서 유저넘버 가져오고
//			DTO.SETU_no(SELECT MAPPER DTO)
			// 유저 넘버로 유저 인포 인설트하고
//			USER INFO(DTO)
			// 유저 넘버로 유저 피지컬로그 인설트하고
//			USER 피지컬(DTO)
			return "redirect:/page/login";
		}
	}
	
	@Override
	public void signUpInfo(InfoDto dto) {
		signMapper.signUpInfo(dto);
	}

	@Override
	public void signUpPhy(PhysicalDto dto) {
		signMapper.signUpPhy(dto);
	}

	// 암호화 확인해주는 함수
	@Override
	public ArrayList<SignDto> loginList() {
		return signMapper.loginList();
	}

	 //로그인
	@Override
	public InfoDto signIn(String U_id, String U_pw) {
		// U_pw 는 user 정보 조회할때 참조하지않아 지움
		SignDto user = signMapper.signIn(U_id); // DB에서 사용자 정보를 가져옴
	    System.out.println(U_pw);
	    System.out.println(user.getU_pw());
	    
	    if (user != null && encoder.matches(U_pw, user.getU_pw())) {
	        // 비밀번호가 일치하면 로그인 성공
	    	// 인포dto 를 리턴하게 변경, U_no 로 조회
	        return signMapper.userInfo(user.getU_no());
	    }
	    return null;
	}
	
	//아이디 중복체크
	@Override
	public boolean selectId(String U_id) {
		System.out.println("아이디중복체크"+" "+U_id);
		return signMapper.selectId(U_id);
	}
	
	//닉네임 중복체크
	@Override
	public boolean selectName(String I_name) {
		System.out.println("아이디중복체크"+" "+I_name);
		return signMapper.selectName(I_name);
	}
	
	//아이디 찾기
	@Override
	public String searchId(String I_email) {
		return signMapper.searchId(I_email);
	}
	
	//힌트 질문 찾기
	@Override
    public InfoDto searchFinding(SignDto dto) {
        return signMapper.searchFinding(dto);
	}
	
	//작성한 힌트 비교
	@Override
	public boolean searchPwHint(SignDto dto) {
		System.out.println(dto);
		
		if (signMapper.searchPwHint(dto) == 1) {
			System.out.println("힌트 잘맞아요~");
			return true;
		} else {
			System.out.println("힌트가 안맞아요 ");
			return false;
		}
	}
	
	//비밀번호 재설정
	@Override
	public void pwChange(SignDto dto) {
		System.out.println(dto);
		System.out.println("암호화전 비밀번호: "+dto.getU_pw());
		String newPw = encoder.encode(dto.getU_pw());
		dto.setU_pw(newPw);
		System.out.println("암호화후 비밀번호: "+dto.getU_pw());
		signMapper.pwChange(dto);
	}

}

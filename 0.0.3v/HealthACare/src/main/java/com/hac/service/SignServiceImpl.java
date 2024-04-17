package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public String signUp(SignDto dto, InfoDto infoDto, PhysicalDto phyDto, Model model) {

		if (dto.getU_id() == null || dto.getU_id().trim().isEmpty()) {
			System.out.println("빈 ID 회원가입");
			return "ID를 입력해주세요."; // 회원가입 폼으로 이동
		}

		if (!dto.getU_id().matches("[a-zA-Z0-9]+")) {
			System.out.println("한글 또는 특수문자 포함 ID 회원가입...................");
			return "ID는 영문자와 숫자로만 입력해주세요."; // 회원가입 폼으로 이동
		}

		if (dto.getU_pw() == null || dto.getU_pw().trim().isEmpty()) {
			System.out.println("빈 PW 회원가입");
			return "PW를 입력해주세요.";
		}

		if (dto.getU_pw().length() < 8) {
			System.out.println("비밀번호 불일치 회원가입");
			return "비밀번호는 8자 이상이여야합니다.";
		}

		if (!dto.getU_pw().equals(dto.getU_repw())) {
			System.out.println("비밀번호 확인 불일치 회원가입");
			return "비밀번호가 일치하지 않습니다.";
		}

		if (signMapper.selectId(dto.getU_id())) {
			System.out.println("아이디 중복 검사");
			return "이미 존재하는 ID입니다.";

		}
		
		if (infoDto.getI_hint() == null || infoDto.getI_hint().trim().isEmpty()) {
			System.out.println("힌트 답이 존재하지 않는다.");
			return "힌트 질문에 답을 적어주세요";
		}
		
		String email = dto.getI_email(); // 이메일 주소를 가져옵니다.
		String[] parts = email.split("@"); // '@' 기호를 기준으로 문자열을 분할합니다.
		String username = parts[0]; // '@' 기호 앞 부분을 추출합니다.
		System.out.println("이메일 주소 앞 부분: " + username);
		
		if (!username.matches("[a-zA-Z0-9]+")) {
			System.out.println("한글 또는 특수문자 포함 이메일 회원가입...................");
			return "이메일은 영문자와 숫자로만 입력해주세요."; // 회원가입 폼으로 이동
		}

		if (signMapper.selectEmail(dto.getI_email())) {
			System.out.println("이메일 중복검사");
			return "이미 존재하는 이메일입니다.";
			
			
		} else {
			dto.setU_pw(encoder.encode(dto.getU_pw()));
			signMapper.signUp(dto); // 회원가입 진행
			infoDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			phyDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			signMapper.signUpInfo(infoDto);
			signMapper.signUpPhy(phyDto);

			return "";
		}
	}

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

	// 로그인
	@Override
	public InfoDto signIn(String U_id, String U_pw) {
		// U_pw 는 user 정보 조회할때 참조하지않아 지움
		SignDto user = signMapper.signIn(U_id); // DB에서 사용자 정보를 가져옴

		System.out.println(U_pw);
		System.out.println(user.getU_pw());

		if (user != null && encoder.matches(U_pw, user.getU_pw())) {
			// 비밀번호가 일치하면 로그인 성공
			// 인포dto 를 리턴하게 변경, U_no 로 조회
			System.out.println("유저 dto 가져옴");
			return signMapper.userInfo(user.getU_no());
		}
		return null;
	}

	// 아이디 중복체크
	@Override
	public boolean selectId(String U_id) {
		System.out.println("아이디중복체크" + " " + U_id);
		return signMapper.selectId(U_id);
	}

	// 닉네임 중복체크
	@Override
	public boolean selectName(String I_name) {
		System.out.println("아이디중복체크" + " " + I_name);
		return signMapper.selectName(I_name);
	}

	//이메일 중복체크
	@Override
	public boolean selectEmail(String I_email) {
		System.out.println("이메일중복체크" + " " + I_email);
		return signMapper.selectEmail(I_email);
	}
	
	// 아이디 찾기
	@Override
	public String searchId(String I_email) {
		return signMapper.searchId(I_email);
	}

	// 힌트 질문 찾기
	@Override
	public InfoDto searchFinding(SignDto dto) {
		return signMapper.searchFinding(dto);
	}

	// 작성한 힌트 비교
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

	// 비밀번호 재설정
	@Override
	public String pwChange(SignDto dto, Model model) {
		System.out.println(dto);
		System.out.println("암호화전 비밀번호: " + dto.getU_pw());
		if (dto.getU_pw() == null || dto.getU_pw().trim().isEmpty()) {
			System.out.println("빈 PW 회원가입");
			return "PW를 입력해주세요.";
		}

		if (dto.getU_pw().length() < 8) {
			System.out.println("비밀번호 불일치 재설정");
			return "비밀번호는 8자 이상이여야합니다.";
		}

		if (!dto.getU_pw().equals(dto.getU_repw())) {
			System.out.println("비밀번호 확인 불일치 재설정");
			return "비밀번호가 일치하지 않습니다.";
		} else {
			String newPw = encoder.encode(dto.getU_pw());
			dto.setU_pw(newPw);
			System.out.println("암호화후 비밀번호: " + dto.getU_pw());
			signMapper.pwChange(dto);
			return "";
		}
	}

}

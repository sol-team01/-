package com.hac.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.MyPageService;
import com.hac.service.SignService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myInfo/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
// 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
//					// 해줌(@Auto.. 처럼)
@Controller
public class InfoChangeController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	@Setter(onMethod_ = @Autowired)
	private SignService sService;

	
	String mag;


	@GetMapping("/myInfoChange")
	public String change(MyPageDto dto, Model model, HttpServletRequest request) {
		System.out.println("나의정보수정 화면진입");
		HttpSession session = request.getSession();

		dto.setU_no(((InfoDto) session.getAttribute("login")).getU_no());

		// 저장되어있는 기본 정보 출력
		model.addAttribute("myInfo", service.myProfile(dto));
		return "page/myInfoChange";

	}
	
	//이미지 파일 저장
	@PostMapping("/profile")
	public String profileUpdate(@RequestPart("imageFile") MultipartFile file, MyPageDto dto, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();

		dto.setU_no(((InfoDto) session.getAttribute("login")).getU_no());

		//닉네임 및 이메일중복검사를 통과한후 정보 변경 가능하도록 로직 수정
		if(((dto.getI_name() == null && dto.getI_name().length() > 0) || !sService.selectName(dto.getI_name()))
			    && ((dto.getI_email() == null) || !sService.selectEmail(dto.getI_email()))) {
			// 이미지 변환후 저장
			// 이미지 파일 선택되있을때 구분
		if (file != null && !file.isEmpty()) {
			try {
				// file.getBytes() 부분이 이미지 파일을 바이트로 쪼개는 역할을함.
				// dto 바이트 배열에 저장
				dto.setI_profileImg(file.getBytes());

				// 이미지 파일을 info에 저장
				service.profileImgChange(dto);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 닉네임 중복
		if(dto.getI_name() != null && dto.getI_name().length() > 0) {
			
				service.nameChange(dto);

			}
		// 이메일 중복
		if(dto.getI_email() != null) {

			service.emailChange(dto);
	
		}
		if(dto.getI_hint() != null) {
			service.pwFindingChange(dto);
		}
		
		}else {
			System.out.println("정보 안바뀌지롱");
			return "redirect:/myPage/myInfo";
		}
		session.setAttribute("login",service.getInfoDto(dto.getU_no()));
		
		return "redirect:/myPage/myInfo";
	}


}

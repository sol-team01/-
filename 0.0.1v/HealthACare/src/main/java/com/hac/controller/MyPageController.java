package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myPage/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
@AllArgsConstructor // 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
					// 해줌(@Auto.. 처럼)
@Controller
public class MyPageController {

	private MyPageService service;
	String mag;
	
	
	@GetMapping("/name")
	public String nameChange(MyPageDto dto, Model model,H) {

		// 닉네임 길이 검사
		if (dto.getI_name() != null && !dto.getI_name().equals(null)) {
			// 중복 닉네임 검사해줌
			if (service.nameCount(dto.getI_name())) {

				// 닉네임 시간 검사 통과못하면 else 로 빠지고 통과되면 변경완료됨.
				if (service.nameChange(dto)) {
					model.addAttribute("mag", "닉네임 변경 완료");
					return "닉네임 변경 완료";
				} else {

					return "하루에 한번만 닉네임 변경이 가능합니다.";
				}

			} else {

				return "중복 닉네임이 있습니다.";
			}
		} else {

			return "값이 null임";
		}
	}

	
	// 이건 추후에 수정해야함
	@PostMapping("/profileImg")
	public String profileImgChange(@RequestPart("imageFile") MultipartFile file, Model model) {

		// 이미지를 첨부중인지 확인하는 함수
		if (file != null && !file.isEmpty()) {
			// 프로필 시간 검사 통과못하면 else 로 빠지고 통과되면 변경완료됨.
			if (service.profileImgChange(dto)) {

				return "프로필 사진 변경 완료";
			} else {

				return "하루에 한번만 프로필사진 변경이 가능합니다.";
			}

		} else {
			return "값이 null임";
		}

	}

	@GetMapping("/physical")
	public String physical(MyPageDto dto, Model model) {

		// 신체정보 입력
		if (dto.getI_height() != null && dto.getI_weight() != null &&!dto.getI_height().equals(null) && !dto.getI_weight().equals(null)) {
			// 업데이트 or 인설트 함. 그 결과값이 String 으로 리턴이 됨
			mag = service.physical(dto);
			
			
			return mag;
		} else {

			return "입력한 신체정보가 없습니다.";
		}

	}

}

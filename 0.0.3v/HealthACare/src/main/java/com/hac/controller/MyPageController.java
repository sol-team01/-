package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myPage/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
// 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
//					// 해줌(@Auto.. 처럼)
@Controller
public class MyPageController {

@Setter(onMethod_ = @Autowired)
	private MyPageService service;

	String mag;
	
	//마이페이지로 이동
	@GetMapping("/myPage")
	public String nameChange(MyPageDto dto, Model model,HttpServletRequest request) {

	HttpSession session = request.getSession();
	
	
	return "/page/myPage";
	}

	 // 신체 정보 변경
	@GetMapping("/physical")
	public String physical(MyPageDto dto, Model model, HttpServletRequest request) {

		// 신체정보 입력
		if (dto.getP_height() != null && dto.getP_weight() != null && !dto.getP_height().equals(null)
				&& !dto.getP_weight().equals(null)) {
			// 업데이트 or 인설트 함. 그 결과값이 String 으로 리턴이 됨
			String mag = service.physical(dto);

			return mag;
		} else {

			return "입력한 신체정보가 없습니다.";
		}

	}

}

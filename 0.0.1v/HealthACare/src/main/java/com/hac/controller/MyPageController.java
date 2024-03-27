package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myPage/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
@AllArgsConstructor // 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
					// 해줌(@Auto.. 처럼)
@Controller
public class MyPageController {
//
//	private MyPageService service;
//	private  
//	
//	@GetMapping("/name")
//	public String nameChange(MyPageDto dto, Model model) {
//		
//	if()
//		if(service.nameChange(dto)) {
//		
//	
//		} else {
//			
//			return ;
//		}
//		
//		
//		
//		return "홈페이지로";
//	}
	
	
	
}

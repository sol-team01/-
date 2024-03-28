package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hac.dto.searchDto.SignDto;
import com.hac.service.SignService;

import lombok.AllArgsConstructor;

@RequestMapping("/page/*")
@AllArgsConstructor
@Controller
public class SignController {
	private final SignService signservice;
	
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 컨트롤러 진입");
		return "/page/login";
	}
	
	@GetMapping("/signUp")
	public String signUp(Model m) {
		System.out.println("회원가입 진입");
		m.addAttribute("list", signservice.loginList());
		return "/page/signUp";
	}
	
	@PostMapping("/createId")
	public String createId(SignDto dto) {
		signservice.signUp(dto);
		return "redirect:/";
	}
	
	@PostMapping("/signIn")
	public String sigIn(HttpServletRequest request, @RequestParam("id") String id, @RequestParam("pw") String pw) {
		SignDto dto = signservice.signIn(id, pw);
		HttpSession session = request.getSession();
		System.out.println("=======로그인 잘 통과하는가?=======");
		if(dto != null) {
			session.setAttribute("login", dto.getU_id());
			System.out.println("로그인 성공");
			return "redirect:/home";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/home";
		}
	}
	
	@GetMapping("/signIn")
	public void signIn(SignDto dto) {
	}
}

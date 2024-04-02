package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.SignService;

import lombok.AllArgsConstructor;

@RequestMapping("/page/*")
@AllArgsConstructor
@Controller
public class SignController {
	private final SignService signservice;
	
	
	//로그인 페이지로 이동
	@GetMapping("/myPage")
	public String myPage() {
		System.out.println("myPage 컨트롤러 진입");
		return "/page/myPage";
	}
	
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 컨트롤러 진입");
		return "/page/login";
	}
	
	//회원가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp(Model m) {
		System.out.println("회원가입 진입");
		m.addAttribute("list", signservice.loginList());
		return "/page/signUp";
	}
	
	//회원가입
	
	@PostMapping("/createId")
	public String createId(@ModelAttribute SignDto signDto, @ModelAttribute InfoDto infoDto, @ModelAttribute PhysicalDto phyDto) {
		signservice.signUp(signDto,infoDto, phyDto);
		signDto.getU_no();
//		signservice.signIn().getU_no());
//		signservice.signUpInfo();
		return "redirect:/page/login";
	}
	
	//로그인
	@PostMapping("/signIn")
	public String signIn(HttpServletRequest request, @RequestParam("U_id") String U_id, @RequestParam("U_pw") String U_pw) {
		SignDto dto = signservice.signIn(U_id, U_pw);
		HttpSession session = request.getSession();
		System.out.println("=======로그인 잘 통과하는가?=======");
		if(dto != null) {
			session.setAttribute("login", dto.getU_id());
			System.out.println("로그인 성공");
			return "redirect:/";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/page/login";
		}
	}
	
	//로그인
	@GetMapping("/signIn")
	public void signIn(SignDto dto) {	
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    session.removeAttribute("login");
	    return "redirect:/";
	}
	
	@PostMapping("/ConfirmId")
	   @ResponseBody
	   public ResponseEntity<Boolean> confirmId(String id) {
	      System.out.println("confirmId 컨트롤러 진입...................");
	      System.out.println("id : " + id);
	      boolean result = true;
	      
	      
	      if(id.trim().isEmpty()) {
	         System.out.println("id : " + id);
	         result = false;
	      } else {
	         if (signservice.selectId(id)) {
	            result = false;
	         } else {
	            result = true;
	         }
	      }
	      
	      return new ResponseEntity<>(result, HttpStatus.OK);
	   }
}

package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hac.dto.searchDto.LoginDto;
import com.hac.service.SignService;

import lombok.Setter;

@Controller
@RequestMapping("/sign")
//@AllArgsConstructor
public class SignController {
	
	
	@Setter(onMethod_ = @Autowired)
	private SignService signservice;
	
	@GetMapping("/signUp")	
	public void signUp(Model model) {
		System.out.println("회원가입 진입");
		model.addAttribute("loginList",signservice.loginList());
	}
	
	@PostMapping("/createId")
	public String createId(LoginDto dto) {
		signservice.login(dto);
		return "redirect:/page/home";
	}
	
	@PostMapping("/signIn")
	public String sigIn(HttpServletRequest request, @RequestParam("id") String id, @RequestParam("pw") String pw) {
		LoginDto dto = signservice.signIn(id, pw);
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
	public void signIn(LoginDto dto) {
	}
	
	 // 중복 체크를 위한 요청 처리
    @ResponseBody
    @GetMapping("/checkId")
    public String checkId(@RequestParam("id") String id) {
        boolean countCheck = signservice.countCheck(id);
        
        return String.valueOf(countCheck);
    }
}
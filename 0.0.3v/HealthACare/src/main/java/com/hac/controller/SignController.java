package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

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
import com.hac.service.PhysicalService;
import com.hac.service.SignService;

import lombok.AllArgsConstructor;

@RequestMapping("/page/*")
@AllArgsConstructor
@Controller
public class SignController {
	private final SignService signservice;
	private final PhysicalService pService;

	// 로그인 페이지로 이동
	@GetMapping("/myPage")
	public String myPage(@RequestParam("uno") String uno, Model model) {
		System.out.println("myPage 컨트롤러 진입");
		model.addAttribute("physical", pService.searchPhysical(uno));
		return "/page/myPage";
	}

	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 컨트롤러 진입");
		return "/page/login";
	}

	// 회원가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp(Model m) {
		System.out.println("회원가입 진입");
		m.addAttribute("list", signservice.loginList());
		return "/page/signUp";
	}

	// 회원가입
	@PostMapping("/createId")
	public String createId(@ModelAttribute SignDto signDto, @ModelAttribute InfoDto infoDto,
			@ModelAttribute PhysicalDto phyDto, Model model) throws UnsupportedEncodingException {

		String result = signservice.signUp(signDto, infoDto, phyDto, model);

		// 오류 메시지 확인 후 리다이렉트
		if (!result.isEmpty()) {
		    return "redirect:/page/signUp?error=" + URLEncoder.encode(result, "UTF-8");
		} else {
			signservice.signUp(signDto, infoDto, phyDto, model);
			signDto.getU_no();
			return "redirect:/page/login";
		}
	}

	// 로그인
	@PostMapping("/signIn")
	public ResponseEntity<Map<String, Object>> signIn(HttpServletRequest request, @RequestParam("U_id") String U_id,
			@RequestParam("U_pw") String U_pw) {
		InfoDto dto = signservice.signIn(U_id, U_pw);
		HttpSession session = request.getSession();
		System.out.println("=======로그인 잘 통과하는가?=======");
		
		Map<String, Object> response = new HashMap<>();
		if (dto != null) {
			session.setAttribute("login", dto);
			response.put("success", true);
			return ResponseEntity.ok(response);
		} else {
		    response.put("success", false);
		    return ResponseEntity.ok(response);
		}
	}

	// 로그인
	@GetMapping("/signIn")
	public void signIn(SignDto dto) {
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("login");
		session.removeAttribute("U_no");
		return "redirect:/";
	}
	
	//아이디 찾기
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id) {
		System.out.println("confirmId 컨트롤러 진입...................");
		System.out.println("id : " + id);
		boolean result = true;

		if (id.trim().isEmpty()) {
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
	
	//중복 닉네임 검사
	@PostMapping("/ConfirmName")
	@ResponseBody
	public ResponseEntity<Boolean> confirmName(String name) {
		System.out.println("confirmName 컨트롤러 진입...................");
		System.out.println("name : " + name);
		boolean result = true;

		if (name.trim().isEmpty()) {
			System.out.println("name : " + name);
			result = false;
		} else {
			if (signservice.selectName(name)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 아이디 찾기
	@PostMapping("/searchId")
	@ResponseBody
	public String searchId(@RequestParam("I_email") String I_email) {
		String userId = signservice.searchId(I_email); // 해당 이메일 주소에 대한 아이디를 찾음
		String result;
		if (userId != null) {
			System.out.println("아이디 잘 찾았어?" + " " + userId);
			result = userId;
		} else {
			result = "";
		} // 아이디를 찾은 경우 해당 아이디를 반환, 찾지 못한 경우 빈 문자열 반환

		return result;
	}

	// 비밀번호 찾기 질문 가져오기
	@PostMapping("/searchPw")
	public String searchPw(SignDto dto, Model model) {
		System.out.println(dto);
		if(dto.getDomainList().length()>0) {
		dto.setI_email(dto.getEmail()+"@"+dto.getDomainList());
		} else {
			dto.setI_email(dto.getEmail()+"@"+dto.getDomain());
		}
		System.out.println(dto.getI_email());
		InfoDto pwFinding = signservice.searchFinding(dto);
		if (pwFinding != null) {
			System.out.println("pwFinding: " + pwFinding);
			model.addAttribute("pwFinding", pwFinding);
			return "/page/searchPwHint"; // 뷰 이름 반환
		} else {
			System.out.println("일치하는 아이디가 없다. " + pwFinding);
			return "/page/searchPw";
		}
	}

	// 아이디 찾기 jsp 진입
	@GetMapping("/searchIdPw")
	public String searchId() {
		System.out.println("아이디 찾기 진입");
		return "/page/searchId";
	}

	// 비밀번호 찾기 jsp 진입
	@GetMapping("/searchPwId")
	public String searchPw() {
		System.out.println("비밀번호 찾기 진입");
		return "/page/searchPw";
	}

	// 비밀번호 힌트 비교
	@PostMapping("/searchHint")
	public String searchHint(SignDto dto, Model model) {
		System.out.println(dto);
	
		if(signservice.searchPwHint(dto)) {
			model.addAttribute("U_no",dto.getU_no());
			return "/page/resetPw";
		} else {			
			model.addAttribute("mag","이거 틀렸어요");
			return "/page/searchPwHint";
		}
	}
	
	//비밀번호 재설정
	@PostMapping("/pwChange")
	public String pwChange(SignDto dto) {
		System.out.println("비밀번호 변경 진입");
		signservice.pwChange(dto);
		return "/page/login";
	}
}

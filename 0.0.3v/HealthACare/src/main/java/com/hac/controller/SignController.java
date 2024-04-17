package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.google.gson.JsonObject;
import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.SignService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@RequestMapping("/page/*")
@AllArgsConstructor
@Controller
public class SignController {
   private final SignService signservice;

	ServletContext servletContext;

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
         @ModelAttribute PhysicalDto phyDto, Model model,HttpServletRequest request) throws UnsupportedEncodingException,IOException {
		// 내부경로로 저장
		String realPath = servletContext.getRealPath("/");
	   String baseImgUrl = realPath + "resources/baseImg/baseImg.jpg";
           // 이미지 파일을 읽기 위한 FileInputStream 생성
	   System.out.println(baseImgUrl);
           FileInputStream fileInputStream = new FileInputStream(new File(baseImgUrl));

           // 이미지 파일의 크기를 구함
           long fileSize = new File(baseImgUrl).length();

           // 이미지 파일의 크기만큼 바이트 배열 생성
           byte[] imageBytes = new byte[(int) fileSize];

           // 이미지 파일에서 바이트를 읽어와 바이트 배열에 저장
           fileInputStream.read(imageBytes);

           // 파일을 사용한 후에는 항상 닫아야 합니다.
           fileInputStream.close();
           infoDto.setI_profileImg(imageBytes);
	   
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
         dto.setI_profileImg(null);
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
   
   //아이디 중복체크
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
   
   //닉네임 중복체크
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
   
   //이메일 중복체크
   @PostMapping("/ConfirmEmail")
   @ResponseBody
   public ResponseEntity<Boolean> confirmEmail(String email) {
	   System.out.println("confirmName 컨트롤러 진입...................");
	   System.out.println("email : " + email);
	   boolean result = true;
	   
	   if (email.trim().isEmpty()) {
		   System.out.println("email : " + email);
		   result = false;
	   } else {
		   if (signservice.selectEmail(email)) {
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
   @ResponseBody
   public Map<String, Object> searchHint(SignDto dto) {
       Map<String, Object> response = new HashMap<>();
       System.out.println("U_no: "+dto.getU_no());
       if (signservice.searchPwHint(dto)) {
           response.put("valid", true);
           response.put("U_no", dto.getU_no()); // U_no 값을 response에 추가
       } else {
           response.put("valid", false);
       }
       
       return response;
   }
   
   //비밀번호 재설정
   @PostMapping("/pwChange")
   public String pwChange(SignDto dto, Model model,@RequestParam("U_no")String U_no) throws UnsupportedEncodingException {
      System.out.println("비밀번호 변경 진입");
      dto.setU_no(U_no);
      System.out.println("U_no: " + dto.getU_no());
      String result = signservice.pwChange(dto, model);
      if (!result.isEmpty()) {
          return "redirect:/page/resetPw?error=" + URLEncoder.encode(result, "UTF-8");
      } else {
      return "redirect:/page/login";
      }
   }
   
   @GetMapping("/resetPw")
   public void resetPw(@RequestParam("U_no")String U_no,Model model) {
      System.out.println("resetPw 컨트롤러 번호받아옴?: " + U_no);
      model.addAttribute("Uno", U_no);
   }
   
}
   
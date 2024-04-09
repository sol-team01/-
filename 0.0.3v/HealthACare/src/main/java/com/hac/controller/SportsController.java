package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.dto.userDto.InfoDto;
import com.hac.service.SignService;

import lombok.AllArgsConstructor;

@RequestMapping("/sports/*")
@AllArgsConstructor
@Controller
public class SportsController {
   private final SignService signservice;

   // 로그인 페이지로 이동
   @GetMapping("/howtoSports")
   public String myPage(HttpServletRequest request) {
      System.out.println("howtoSports 컨트롤러 진입");
		HttpSession session = request.getSession();
		String U_no = ((InfoDto) session.getAttribute("login")).getU_no();
		

      return "/sports/howtoSports";
   }
}
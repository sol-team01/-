package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.service.SignService;

import lombok.AllArgsConstructor;

@RequestMapping("/sports/*")
@AllArgsConstructor
@Controller
public class SportsController {
   private final SignService signservice;

   // 로그인 페이지로 이동
   @GetMapping("/howtoSports")
   public String myPage() {
      System.out.println("howtoSports 컨트롤러 진입");
      return "/sports/howtoSports";
   }
}
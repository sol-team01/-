package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.dto.userDto.InfoDto;
import com.hac.service.MyPageService;
import com.hac.service.ThemeService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@RequestMapping("/sports/*")
@AllArgsConstructor
@Controller
public class SportsController {
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService mService;
	@Autowired
	private ThemeService tService;

   @GetMapping("/howtoSports")
   public String myPage(Model model,HttpServletRequest request) {
      System.out.println("howtoSports 컨트롤러 진입");
		HttpSession session = request.getSession();
		String U_no = ((InfoDto) session.getAttribute("login")).getU_no();
		 model.addAttribute("physical",mService.myPhysical(U_no));
		 tService.themeHit("1");
      return "/sports/howtoSports";
   }
}
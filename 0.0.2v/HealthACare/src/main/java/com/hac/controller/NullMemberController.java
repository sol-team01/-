package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.service.BasicService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/NullMember/*")
@AllArgsConstructor	
@Controller
public class NullMemberController {
	
	private BasicService service;
	
//	@GetMapping("/BbsFood")	
//	public String BbsCustomer(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
//		System.out.println("apicontroller로 대체됨");
//		return "redirect:/NullMember/test";
//	}
	@GetMapping("/BbsDisease")	
	public String n_BbsDisease() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsDisease";
	}
	@GetMapping("/BbsHealth")	
	public String n_BbsHealth() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsHealth";
	}
	@GetMapping("/BbsCustomer")	
	public String n_BbsCustomer() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsCustomer";
	}
}
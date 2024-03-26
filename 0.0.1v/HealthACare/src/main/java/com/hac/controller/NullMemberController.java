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
	
	@GetMapping("/BbsFood")	
	public String BbsCustomer() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsFood";
	}
	@GetMapping("/BbsDisease")	
	public String BbsDisease() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsDisease";
	}
	@GetMapping("/BbsHealth")	
	public String BbsHealth() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsHealth";
	}
	@GetMapping("/BbsCustomer")	
	public String mainWeb() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsCustomer";
	}
}
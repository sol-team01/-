package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/error/*")
@AllArgsConstructor
@Controller
public class ErrorController {

	@GetMapping("/error404") 
	public void error404() {
		System.out.println("에러 컨트롤러진입");
//		return "error/error404";
	}
}
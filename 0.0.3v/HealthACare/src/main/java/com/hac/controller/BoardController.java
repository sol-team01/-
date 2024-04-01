package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.service.BoardService;

import lombok.AllArgsConstructor;

@RequestMapping("/page/*")
@AllArgsConstructor
@Controller

public class BoardController {
	
	//로그인 페이지로 이동
	@GetMapping("/noticeBoard")
	public String noticeBoard() {
		System.out.println("게시판 컨트롤러 진입");
		return "/page/noticeBoard";
	}
	
	
}


package com.hac.controller;

import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
=======
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
>>>>>>> c4e62d34593752906926764d73c4cf0d310ab7de

import com.hac.service.BoardService;

import lombok.AllArgsConstructor;

<<<<<<< HEAD
@RequestMapping("/board/*")
@AllArgsConstructor
@Controller
public class BoardController {
	private final BoardService service;
	
	@GetMapping("/BoardList")
	public void BoardList(@RequestParam(value="currentPage",defaultValue="1") int currentPage, Model m) {
		System.out.println("..................BoardList 진입");
		m.addAttribute("list", service.getList(currentPage));
		m.addAttribute("totalContent", service.totalContent());
		m.addAttribute("paging", service.pageBlock(currentPage, null));
	}
	
	@GetMapping("/BoardSearch")
	public void getSearch(@RequestParam("currentPage") int currentPage,@RequestParam("word") String word, Model m) {
		m.addAttribute("search", service.searchList(currentPage, word));
		m.addAttribute("searchPaging", service.pageBlock(currentPage, word));
	}
	
}
=======
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

>>>>>>> c4e62d34593752906926764d73c4cf0d310ab7de

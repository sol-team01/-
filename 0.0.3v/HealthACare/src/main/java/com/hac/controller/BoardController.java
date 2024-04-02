package com.hac.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hac.service.BoardService;

import lombok.AllArgsConstructor;

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


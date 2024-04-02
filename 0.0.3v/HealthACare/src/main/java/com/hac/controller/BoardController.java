package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hac.dto.boardDto.BoardDto;
import com.hac.service.BoardService;

import lombok.AllArgsConstructor;

@RequestMapping("/board/*")
@AllArgsConstructor
@Controller
public class BoardController {
	private final BoardService service;
	
	

	@GetMapping("/noticeBoard")
	public void BoardList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("..................BoardList 진입");
		String userId = (String) session.getAttribute("login");
		System.out.println(userId);
		m.addAttribute("bId", userId);
		m.addAttribute("list", service.getList(currentPage));
		m.addAttribute("totalContent", service.totalContent());
		m.addAttribute("paging", service.pageBlock(currentPage, null));
	}

	@GetMapping("/BoardSearch")
	public void getSearch(@RequestParam("currentPage") int currentPage, @RequestParam("word") String word, Model m) {
		m.addAttribute("search", service.searchList(currentPage, word));
		m.addAttribute("searchPaging", service.pageBlock(currentPage, word));
	}
	
	@GetMapping("/writeBoard")
	public void writeBoard(HttpServletRequest request, Model m) {
		System.out.println("..................writeBoard 진입");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("login");
		m.addAttribute("bId", userId);
	}
	
	@PostMapping("/write")
	public String write(BoardDto dto) {
		service.write(dto);
		return "redirect:/board/noticeBoard";
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	@GetMapping("/readBoard")
	public void read(@RequestParam("b_NO") long bno, Model m,HttpServletRequest request) {
		System.out.println("..................readBoard 진입");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("login");
		m.addAttribute("bId", userId);
		m.addAttribute("read", service.read(bno));
		service.hit(bno);
	}
	
	@GetMapping("/modifyBoard")
	public void modifyBoard(@RequestParam("b_NO") long b_NO, Model m,HttpServletRequest request) {
		System.out.println("..................modifyBoard 진입");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("login");
		m.addAttribute("bId", userId);
		m.addAttribute("read", service.read(b_NO));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDto dto) {
		service.modify(dto);
		return "redirect:/board/noticeBoard";
	}
	
	@GetMapping("/del")
	public String del(@RequestParam("b_NO") long bno) {
		service.del(bno);
		return "redirect:/board/noticeBoard";
	}
}

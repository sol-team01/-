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
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.BoardService;

import lombok.AllArgsConstructor;

@RequestMapping("/board/*")
@AllArgsConstructor
@Controller
public class BoardController {
	private final BoardService service;
	
	

	@GetMapping("/noticeBoard")
	public void BoardList(
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "sort", required = false) String sort,
			Model m,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String sessionSort = (String) session.getAttribute("sort");
		BoardSDto dtos = new BoardSDto();
		int sortValue = 0;
		if (sort != null) {
	        // AJAX 요청으로 받은 선택한 정렬 방식을 세션에 저장
	        session.setAttribute("sort", sort);
	        if (sort.equals("asc")) {
	            sortValue = 1;
	        }
	    } else if (sessionSort != null) {
	        // 세션에 저장된 정렬 방식 사용
	        if (sessionSort.equals("asc")) {
	            sortValue = 1;
	        }
	    }
		System.out.println("..................BoardList 진입");
		InfoDto user = (InfoDto) session.getAttribute("login");
		m.addAttribute("user", user);
		m.addAttribute("list", service.getList(currentPage,sortValue));
		m.addAttribute("totalContent", service.totalContent());
		m.addAttribute("paging", service.pageBlock(currentPage, dtos));
		m.addAttribute("noticeList", service.getNoticeList());
	}

	@GetMapping("/searchBoard")
	public void getSearch(@RequestParam("currentPage") int currentPage, 
	                      @RequestParam("word") String word,
	                      @RequestParam("searchInfo") String searchInfo,
	                      Model m) {
	    System.out.println("..................searchBoard 진입");
	    System.out.println(word);
	    System.out.println(searchInfo);
	    String column = "";
	    if (searchInfo.equals("title")) {
	        column = "B_TITLE";
	    } else if (searchInfo.equals("content")) {
	        column = "B_TEXT";
	    } else if (searchInfo.equals("titleOrContent")) {
	        column = "B_TITLE_OR_B_TEXT";
	    } else if (searchInfo.equals("writer")) {
	        column = "B_ID";
	    }
	    System.out.println(column);
	    BoardSDto dtos = new BoardSDto();
	    dtos.setColumn(column);
	    dtos.setWord(word);
	    System.out.println(dtos);
	    m.addAttribute("search", service.searchList(currentPage, word, column));
	    m.addAttribute("searchPaging", service.pageBlock(currentPage,dtos));
	    m.addAttribute("searchTotal", service.searchTotalContent(dtos));
	    m.addAttribute("noticeList", service.getNoticeList());
	}	
	
	@GetMapping("/writeBoard")
	public void writeBoard(HttpServletRequest request, Model m) {
		System.out.println("..................writeBoard 진입");
		HttpSession session = request.getSession();
		InfoDto user = (InfoDto) session.getAttribute("login");
		m.addAttribute("user", user);
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
		InfoDto user = (InfoDto) session.getAttribute("login");
		m.addAttribute("user", user);
		m.addAttribute("read", service.read(bno));
		service.hit(bno);
	}
	
	@GetMapping("/modifyBoard")
	public void modifyBoard(@RequestParam("b_NO") long b_NO, Model m,HttpServletRequest request) {
		System.out.println("..................modifyBoard 진입");
		HttpSession session = request.getSession();
		InfoDto user = (InfoDto) session.getAttribute("login");
		m.addAttribute("user", user);
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

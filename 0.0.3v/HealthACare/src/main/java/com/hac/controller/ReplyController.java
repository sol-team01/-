package com.hac.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hac.dto.boardDto.ReplyDto;
import com.hac.service.BoardService;
import com.hac.service.ReplyService;

import lombok.AllArgsConstructor;

@RequestMapping("/board/*")
@AllArgsConstructor
@RestController
public class ReplyController {
	private final ReplyService service;
	private final BoardService bService;
	
	@GetMapping("/replyWrite")
	public void replyWrite(
			@RequestParam("textValue")String textValue,
			@RequestParam("U_no") String U_no,
			@RequestParam("I_name") String I_name,
			@RequestParam("B_no") String B_no) {
		ReplyDto dto = new ReplyDto();
		dto.setI_name(I_name);
		dto.setU_no(U_no);
		dto.setR_text(textValue);
		dto.setB_no(B_no);
		service.replyWrite(dto);
		bService.replyCount(B_no);
	}
	
	@PostMapping("/delReply")
	public void delReply(
			@RequestParam("R_no") String R_no,
			@RequestParam("B_no") String B_no
			) {
		service.replyDel(R_no);
		bService.delReplyCount(B_no);
	}
	

}

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
			@RequestParam("uno") long uno,
			@RequestParam("uid") String uid,
			@RequestParam("bno") long bno) {
		ReplyDto dto = new ReplyDto();
		dto.setR_ID(uid);
		dto.setU_NO(uno);
		dto.setR_TEXT(textValue);
		dto.setB_NO(bno);
		service.replyWrite(dto);
		bService.replyCount(bno);
	}
	
	@PostMapping("/delReply")
	public void delReply(
			@RequestParam("rno") long rno,
			@RequestParam("bno") long bno
			) {
		service.replyDel(rno);
		bService.delReplyCount(bno);
	}
	

}

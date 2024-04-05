package com.hac.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hac.dto.searchDto.MyFoodDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.MyPageService;

import lombok.Setter;

@RestController
@RequestMapping("/RestsController/*")
public class RestsController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;

	
	
	// 세션에 저장되어있는 이미지 데이터를 불러와 반환해주는 방식
	@PostMapping("/myImgEncoding")
	public ResponseEntity<String> handleFileUpload(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if ((InfoDto) session.getAttribute("login") != null) {
			String U_no = ((InfoDto) session.getAttribute("login")).getU_no();
			System.out.println(U_no);
			byte[] imageData = service.getByteImg(U_no);
			// byte 배열을 Base64로 인코딩
			String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);
			// 인코딩된 이미지 데이터를 클라이언트에게 반환
			return ResponseEntity.ok().body(base64Image);
		}
		return null;
	}

	// 유저 넘버를 받아오면 그걸로 이미지 데이터를 불러와 인코딩해주는방식
	@PostMapping("/ImgEncoding")
	public ResponseEntity<String> imgEncoding(InfoDto dto) {
		if (dto.getU_no() != null) {
			byte[] imageData = service.getByteImg(dto.getU_no());
			// byte 배열을 Base64로 인코딩
			String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);
			// 인코딩된 이미지 데이터를 클라이언트에게 반환
			return ResponseEntity.ok().body(base64Image);
		}
		return null;

	}
	
	
	
	

	
}

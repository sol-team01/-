package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hac.service.MyPageService;

import lombok.Setter;

@RestController
@RequestMapping("/RestsController/*")
public class RestsController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;

	@PostMapping("/ImgEncoding")
	public ResponseEntity<String> handleFileUpload(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("U_no", "1");
		// 이미지 파일을 byte 배열로 변환
		String U_no = (String) session.getAttribute("U_no");
		byte[] imageData = service.getByteImg(U_no);

		// byte 배열을 Base64로 인코딩
		String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);

		// 인코딩된 이미지 데이터를 클라이언트에게 반환
		return ResponseEntity.ok().body(base64Image);

	}

}
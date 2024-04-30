package com.hac.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.MyPageService;

import lombok.Setter;

@RestController
@RequestMapping("/RestsController/*")
public class RestsController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	@Setter(onMethod_ = @Autowired)
	ServletContext servletContext;
	
	
	// 로그인되어 있는 유저의 프로필사진 불러오기
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
	
	
	

	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
	
		JsonObject jsonObject = new JsonObject();
		// 내부경로로 저장
		String realPath = servletContext.getRealPath("/");
		String fileRoot = realPath+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}
	
	
	
	

	
}

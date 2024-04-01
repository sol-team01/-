package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.hac.dto.foodDto.FoodDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/food/*") 
@AllArgsConstructor 
@Controller
public class FoodController {
		
		// 식품정보 리스트 보기
		@RequestMapping("/list")
		public void list(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
			//인코딩 인증키	
			String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
			String API_URL = null;
			
			try {
				String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
				API_URL = "http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=10&type=json" ;			
				log.info("========" + API_URL);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
			
			RestTemplate restTemplate = new RestTemplate();					
			URI uri = null; 				
			try {					
				uri = new URI(API_URL);				
			} catch (URISyntaxException e) {					
				e.printStackTrace();				
			}
								
//			String s = restTemplate.getForObject(uri, String.class); 			
//			log.info("====== 잘 나오나? "+s);	
			
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); // 자기 클래스로 바꾸시오..							
			log.info("==== food json ==== : ============================ : ");							
				
			
			 model.addAttribute("food", food);
			 
		}
		
		@RequestMapping("/detailList")
		public void detailList(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
			//// 우리나라 공공 api ////					
			//인코딩 인증키					
			String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
			String API_URL = null;
			
			try {
				String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
				API_URL = "https://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=10&type=json" ;			
				log.info("========" + API_URL);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
					// * 주의 * https 아님 http 임. https 는 인증관련 복잡한 처리를 해야함.	
			
//		        descKor="%EB%B0%B0";
			
			RestTemplate restTemplate = new RestTemplate();					
			//// **** 중요 **** uri					
			URI uri = null; //java.net.URI 임포트 하셈					
			try {					
				uri = new URI(API_URL);				
			} catch (URISyntaxException e) {					
				e.printStackTrace();				
			}
								
//			String s = restTemplate.getForObject(uri, String.class); 			
//			log.info("====== 잘 나오나? "+s);	
			
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); // 자기 클래스로 바꾸시오..							
			log.info("==== json ==== : ============================ : ");							
			
			 model.addAttribute("food", food);
			 
		}
		
		@RequestMapping("/information")
		public void information(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
			//// 우리나라 공공 api ////					
			//인코딩 인증키					
			String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
			String API_URL = null;
			
			try {
				String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
				API_URL = "https://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=10&type=json" ;			
				log.info("========" + API_URL);
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
					// * 주의 * https 아님 http 임. https 는 인증관련 복잡한 처리를 해야함.	
			
//		        descKor="%EB%B0%B0";
			
			RestTemplate restTemplate = new RestTemplate();					
			//// **** 중요 **** uri					
			URI uri = null; //java.net.URI 임포트 하셈					
			try {					
				uri = new URI(API_URL);				
			} catch (URISyntaxException e) {					
				e.printStackTrace();				
			}
								
//			String s = restTemplate.getForObject(uri, String.class); 			
//			log.info("====== 잘 나오나? "+s);	
			
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); // 자기 클래스로 바꾸시오..							
			log.info("==== json ==== : ============================ : ");							
				
			
			 model.addAttribute("food", food);
			 
		}

}

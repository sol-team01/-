package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		public void list(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) throws UnsupportedEncodingException {
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
								
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); 	
			
			log.info("==== food list ==== : ============================ : ");							
			
			 model.addAttribute("food", food);
			 
		}
		
		@RequestMapping("/detailList")
		public void detailList(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
//			//인코딩 인증키	
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
								
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); 	
			
			log.info("==== food detailList ==== : ============================ : ");							
			
			 model.addAttribute("food", food);  
		}
		
		@RequestMapping("/information")
		public void information(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
//			//인코딩 인증키	
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
								
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); 	
			
			log.info("==== food json ==== : ============================ : ");							
			
			 model.addAttribute("food", food); 
			
		}
		
		@RequestMapping("/calorieCounting")
		public String calorieCounting(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model, HttpServletRequest request) {
			
			log.info("====여기까진 들어오긴 하나?==== : ");							
			HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음

		    // 세션에 로그인 정보가 없으면 로그인 페이지로 리다이렉트
		    if (session == null || session.getAttribute("login") == null) {
		    	log.info("====여기까진 들어오긴 하나?2222222222==== : ");							
		    	
		        return "redirect:/page/login";
		    }

			//인코딩 인증키	
			String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
			String API_URL = null;
		
			try {
				String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
				API_URL = "http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=20&type=json" ;			
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
								
			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); 	
			
			log.info("==== food json ==== : ============================ : ");							
			
			 model.addAttribute("food", food); 
			
			 return "/food/calorieCounting";
		}
		
    
      
}

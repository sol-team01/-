package com.hac.service;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hac.dto.foodDto.CalorieLogDtoList;
import com.hac.dto.foodDto.FoodDto;
import com.hac.dto.searchDto.MyFoodDtoList;
import com.hac.mapper.CalorieMapper;
import com.hac.service.util.FoodEncoding;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class FoodServiceImpl implements FoodService{

	
	@Setter(onMethod_ = @Autowired)
	private CalorieMapper mapper;	

	
	@Override
	public void insertFoodList(MyFoodDtoList list) {
		mapper.insertFoodList(list);
	 }
	
	@Override
	public List<CalorieLogDtoList> calorieListDto(String U_no){

		List<CalorieLogDtoList> list = mapper.myCalorieLog(U_no);
		
		for(CalorieLogDtoList dto : list) {
			dto.setFoodList(FoodEncoding.foodEncoding(dto.getFoodJSON()));
			if(dto.getC_meal() == 0) {
				dto.setMeal("아침");
			}
			if(dto.getC_meal() == 1) {
				dto.setMeal("점심");	
			}
			if(dto.getC_meal() == 2) {
				dto.setMeal("저녁");	
			}
			if(dto.getC_meal() == 3) {
				dto.setMeal("간식");	
			}

			}
		return list;

		
	}

	@Override
	public FoodDto foodList(String descKor) {
	    
		//인코딩 인증키	n
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
		
		return food;
	}
	
	
}

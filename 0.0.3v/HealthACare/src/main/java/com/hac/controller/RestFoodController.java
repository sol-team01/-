package com.hac.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hac.dto.searchDto.MyFoodDtoList;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.FoodService;

import lombok.Setter;

@RestController
@RequestMapping("/foodRest/*")
public class RestFoodController {
	
	@Setter(onMethod_ = @Autowired)
	private FoodService service;


	

	
	@PostMapping("/insertFoodList")
	public void insertFoodList(@RequestBody MyFoodDtoList list,HttpServletRequest request) {

		HttpSession session = request.getSession();
		list.setU_no(((InfoDto) session.getAttribute("login")).getU_no());
		
		service.insertFoodList(list);
	}
	
}

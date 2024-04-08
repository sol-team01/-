package com.hac.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hac.dto.searchDto.MyFoodDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.service.FoodService;

import lombok.Setter;

@RestController
@RequestMapping("/foodRest/*")
public class RestFoodController {
	
	@Setter(onMethod_ = @Autowired)
	private FoodService service;

	
	
	@PostMapping("/addFood")
	public void myFood(MyFoodDto food,HttpServletRequest request){
		HttpSession session = request.getSession();
		food.setU_no(((InfoDto) session.getAttribute("login")).getU_no());
		service.addFood(food);
	}
	@PostMapping("/removeFood")
	public void removeFood(@RequestParam("index") int index) {
		service.removeFood(index);
	}
	
	@GetMapping("/getFood")
	public List<MyFoodDto> getFood(){
		return service.getFood();
	}
	
	@PostMapping("/insertFoodList")
	public void insertFoodList() {
		service.insertFoodList();
	}
	
	@PostMapping("/resetFood")
	public void resetFood() {
		service.resetFood();
	}
	
}

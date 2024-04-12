package com.hac.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hac.dto.userDto.InfoDto;
import com.hac.dto.userDto.PhysicalLogDto;
import com.hac.service.BoardService;
import com.hac.service.FoodService;
import com.hac.service.MyPageService;
import com.hac.service.PhysicalService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myPage/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
// 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
//					// 해줌(@Auto.. 처럼)
@Controller
public class MyPageController {

@Setter(onMethod_ = @Autowired)
	private MyPageService service;

@Setter(onMethod_ = @Autowired)
	private PhysicalService pService;

@Setter(onMethod_ = @Autowired)
private BoardService BService;

@Setter(onMethod_ = @Autowired)
private FoodService fService;

	String mag;
	
	//마이페이지로 이동
	@GetMapping("/myInfo")
	public String myPage(Model model,HttpServletRequest request) {
		System.out.println("myPage 컨트롤러 진입");
	HttpSession session = request.getSession();
	String U_no = ((InfoDto) session.getAttribute("login")).getU_no();
	ArrayList<PhysicalLogDto> searchPhysical = pService.searchPhysical(U_no);

	
	model.addAttribute("physical",searchPhysical);
	model.addAttribute("presentPhysical",searchPhysical.get(searchPhysical.size()-1));
	model.addAttribute("myCalorieLog",fService.calorieListDto(U_no));
	model.addAttribute("myBoardList",BService.myBoardList(U_no));
	return "/page/myPage";
	}

}

package com.hac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hac.service.PhysicalService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/myPage/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
// 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
//					// 해줌(@Auto.. 처럼)
@Controller
public class PhysicalController {

@Setter(onMethod_ = @Autowired)
	private PhysicalService service;

//	@DeleteMapping("/delete/{U_no}")
//	@ResponseBody
//	public String delete(@PathVariable String U_no) {
//		System.out.println("데이터삭제");
//		service.delPhysical(U_no);
//		return "success";
//	}
	
	@PostMapping("/physicalSumbit")
	public String physicalSumbit(@RequestParam("U_no")String U_no,
			@RequestParam("weight")String weight,
			@RequestParam("height")String height) {
		System.out.println("체중입력 진입................");
		service.setterPhysical(U_no,weight,height);
		return "/page/myPage";
	}
	
	@GetMapping("/physicalSumbit")
	public void physicalSumbit() {
		
	}

}

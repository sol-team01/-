package com.hac.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hac.service.N_BbsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/NullMember/*")
@AllArgsConstructor	
@Controller
@Qualifier
public class NullMemberController {
	
<<<<<<< HEAD
//	@Setter(onMethod_ = @Autowired)
	private n_BbsService service;
=======
	private N_BbsService service;
>>>>>>> bfacba7a0274512072ad5f555847ed421dc31579
	
	@GetMapping("/BbsFood")	
	public String BbsCustomer(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		System.out.println("apicontroller로 대체됨");
		return "redirect:/NullMember/test";
	}
	@GetMapping("/BbsDisease")	
	public String n_BbsDisease() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsDisease";
	}
	@GetMapping("/BbsHealth")	
	public String n_BbsHealth() {
		System.out.println("컨트롤러진입");
		return "NullMember/BbsHealth";
	}
	@GetMapping("/BbsCustomer")	
	public void n_BbsCustomer(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
    	model = service.getList(currentPage, model);
	}
}
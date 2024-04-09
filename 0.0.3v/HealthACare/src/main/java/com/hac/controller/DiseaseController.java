package com.hac.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.xml.sax.SAXException;

import com.hac.dto.diseaseDto.DiseaseDto;
import com.hac.service.DiseaseService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/disease/*")
@AllArgsConstructor
@Controller
public class DiseaseController {

    private final DiseaseService diseaseService;
    
    @GetMapping("/form")
    public String showForm() {
        return "disease/form";
    }

    @PostMapping("/list")
    public String list(@RequestParam String sickCd, Model model) throws IOException, ParserConfigurationException, SAXException {
    	List<DiseaseDto> diseaseList = diseaseService.getDiseaseList(sickCd);
        model.addAttribute("itemList", diseaseList);
        return "/disease/list";
    }

    // /favicon.ico 경로에 대한 요청을 처리하는 핸들러 메서드
    @RequestMapping("/favicon.ico")
    public void favicon(HttpServletResponse response) {
        // favicon 요청에 대한 응답을 404로 설정하여 무시합니다.
        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    }
}

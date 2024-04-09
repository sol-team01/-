package com.hac.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    
    @GetMapping("/list")
    public String list(@RequestParam(name = "sickCd", defaultValue = "A00") String sickCd, Model model) throws IOException, ParserConfigurationException, SAXException {
    	List<DiseaseDto> diseaseList = diseaseService.getDiseaseList(sickCd);
        model.addAttribute("itemList", diseaseList);
        return "/disease/list";
    }

    @GetMapping("/favicon.ico")
    public String favicon() {
        // favicon.ico 요청에 대한 처리를 수행합니다.
        // 이 메서드가 아무런 동작을 하지 않고 빈 문자열을 반환하여 요청을 처리합니다.
        return "";
    }
}

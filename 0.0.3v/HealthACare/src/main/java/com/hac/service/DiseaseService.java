package com.hac.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;

import com.hac.dto.diseaseDto.DiseaseDto;

public interface DiseaseService {
	public List<DiseaseDto> getDiseaseList(String sickCd) throws IOException;

	void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer); 
}

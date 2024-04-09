package com.hac.service;

import java.io.IOException;
import java.util.List;

import com.hac.dto.diseaseDto.DiseaseDto;

public interface DiseaseService {
	public List<DiseaseDto> getDiseaseList(String sickCd) throws IOException; 
}

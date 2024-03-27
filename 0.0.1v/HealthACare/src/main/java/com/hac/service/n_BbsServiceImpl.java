package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hac.dto.n_BbsDto.n_BbsLimitDto;
import com.hac.dto.n_BbsDto.n_BbsMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class n_BbsServiceImpl implements n_BbsService {

	@Setter(onMethod_ = @Autowired)
	private n_BbsMapper mapper;	
	
	@Override
	public Model getList(int currentPage, Model m) {
		log.info("비지니스 계층===========");
		n_BbsLimitDto dto = new n_BbsLimitDto();
		m.addAttribute("currentPage_for", currentPage); //현재 페이지 번호
		
		return m;
	}

}

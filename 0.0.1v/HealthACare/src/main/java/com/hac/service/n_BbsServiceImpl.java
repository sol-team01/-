package com.hac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hac.dto.n_BbsDto.n_BbsLimitDto;
import com.hac.mapper.n_BbsMapper;

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
		
		int totalPage = mapper.getTotalCount()/dto.getPAGE_LINK_AMOUNT();
		int totalBlock = (int)Math.ceil((double)totalPage/dto.getBLOCK_LINK_AMOUNT());
		int currentBlockNo = (int)Math.ceil((double)currentPage/ dto.getPAGE_LINK_AMOUNT());
		int startBlock = (int)Math.ceil((double)(currentBlockNo-1)*dto.getPAGE_LINK_AMOUNT()+1);
		int endPage = currentBlockNo*dto.getPAGE_LINK_AMOUNT();
        m.addAttribute("endPage", endPage); // 한 블럭에 보일 페이지 수
        m.addAttribute("startBlock", startBlock); // 한 블럭에 보일 페이지 수
		
	   	int PAGE_LINK_AMOUNT = dto.getPAGE_LINK_AMOUNT();
        int limitIndex = (currentPage-1) * dto.getPAGE_LINK_AMOUNT();
        
        dto.setPAGE_LINK_AMOUNT(PAGE_LINK_AMOUNT);		
        dto.setLimitIndex(limitIndex);
		m.addAttribute("list", mapper.getList(dto));  //[1] 글페이지 내 글 가져오기
		m.addAttribute("pageCount", mapper.getTotalCount());  //최대 글 수
        		
		return m;
	}

}

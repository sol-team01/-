package com.hac.dto.n_BbsDto;

import org.springframework.ui.Model;

public interface n_BbsMapper {
	public Model getList(int currentPage, Model model); //[1]리스트
}

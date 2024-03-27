package com.hac.mapper;

import java.util.ArrayList;

import com.hac.dto.n_BbsDto.n_BbsDto;
import com.hac.dto.n_BbsDto.n_BbsLimitDto;

public interface n_BbsMapper {
	public ArrayList<n_BbsDto> getList(n_BbsLimitDto dto); //[1]리스트
    public int getTotalCount();     // [1-1] 전체 행 수를 가져오는 메서드 추가

}

package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.mapper.BoardMapper;
import com.hac.process.PagingProcessor;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public ArrayList<BoardDto> getList(int currentPage) {
		int limitIndex = (currentPage-1) * 7;
		return mapper.getList(limitIndex);
	}
	
	@Override
	public ArrayList<BoardSDto> searchList(int currentPage, String word) {
		int limitIndex = (currentPage - 1) * 7;
		BoardSDto search = new BoardSDto();
		search.setLimitIndex(limitIndex);
		search.setWord(word);
		return mapper.searchList(search);
	}
	
	@Override
	public PagingProcessor pageBlock(int currentPage, String word) {
		PagingProcessor paging = new PagingProcessor(currentPage, mapper, word);
		return paging;
	}
	
	@Override
	public int totalContent() {
		int totalContent = mapper.totalContent();
		return totalContent;
	}
	
	@Override
	public BoardDto read(long bno) {
		return mapper.read(bno);
	}
	
	@Override
	public void del(long bno) {
		mapper.del(bno);
	}
	
	@Override
	public void write(BoardDto dto) {
		mapper.write(dto);
	}
	
	@Override
	public void modify(BoardDto dto) {
		mapper.modify(dto);
	}
	
	@Override
	public int hit(long bno) {
		return mapper.hit(bno);
	}

}

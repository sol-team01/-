package com.hac.service;

import java.util.ArrayList;
import java.util.List;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.process.PagingProcessor;
public interface BoardService {
	public ArrayList<BoardDto> getList(int currentPage);
	public ArrayList<BoardSDto> searchList(int currentPage, String word, String column);
	public int totalContent();
	public int searchTotalContent(BoardSDto dto);
	public PagingProcessor pageBlock(int currentPage,BoardSDto dto);
	public BoardDto read(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public void del(long bno);
	public int hit(long bno);

}

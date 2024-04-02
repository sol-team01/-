package com.hac.mapper;

import java.util.ArrayList;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;

public interface BoardMapper {
	public ArrayList<BoardDto> getList(int limitIndex);
	public ArrayList<BoardSDto> searchList(BoardSDto search);
	public int totalContent();
	public int searchListCount(String word);
	public BoardDto read(long bno);
	public void del(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public int hit(long bno);
}

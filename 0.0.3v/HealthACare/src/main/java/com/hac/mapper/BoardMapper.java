package com.hac.mapper;

import java.util.ArrayList;
import java.util.List;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;

public interface BoardMapper {
	public ArrayList<BoardDto> getList(int limitIndex);
	public ArrayList<BoardSDto> searchList(BoardSDto dto);
	public int totalContent();
	public int searchListCount(BoardSDto dto);
	public BoardDto read(long bno);
	public void del(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public int hit(long bno);
}

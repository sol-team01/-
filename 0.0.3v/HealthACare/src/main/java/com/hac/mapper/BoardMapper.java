package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;

public interface BoardMapper {
	public ArrayList<BoardDto> getList(@Param("limitIndex")int limitIndex,@Param("sort")int sort);
	public ArrayList<BoardDto> getNoticeList();
	public ArrayList<BoardDto> getNoticeListFull(int limitIndex);
	public ArrayList<BoardSDto> searchList(BoardSDto dto);
	public int totalContent();
	public int searchListCount(BoardSDto dto);
	public BoardDto read(long bno);
	public void del(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public int hit(long bno);
	public int replyCount(long bno);
	public int delReplyCount(long bno);
}

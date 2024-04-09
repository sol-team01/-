package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.searchDto.WriteDto;

public interface BoardMapper {
	public ArrayList<BoardDto> getList(@Param("limitIndex")int limitIndex,@Param("sort")int sort);
	public ArrayList<BoardDto> getNoticeList();
	public ArrayList<BoardDto> getNoticeListFull(int limitIndex);
	public ArrayList<BoardSDto> searchList(BoardSDto dto);
	public int totalContent();
	public int searchListCount(BoardSDto dto);
	public BoardDto read(String B_no);
	public void del(String B_no);
	public void write(WriteDto dto);
	public void modify(BoardDto dto);
	public int hit(String B_no);
	public int replyCount(String B_no);
	public int delReplyCount(String B_no);
}

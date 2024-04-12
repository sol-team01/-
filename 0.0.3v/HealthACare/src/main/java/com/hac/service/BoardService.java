package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.searchDto.WriteDto;
import com.hac.process.PagingProcessor;
public interface BoardService {
	public ArrayList<BoardDto> getList(int currentPage,int sort);
	public ArrayList<BoardDto> getNoticeList();
	public ArrayList<BoardSDto> searchList(int currentPage, String word, String column);
	public ArrayList<BoardDto> getListNoticeHome();
	public ArrayList<BoardDto> getListReadHome();
	public ArrayList<BoardDto> popularPost();
	public ArrayList<BoardDto> myBoardList(String U_no);
	public int totalContent();
	public int searchTotalContent(BoardSDto dto);
	public PagingProcessor pageBlock(int currentPage,BoardSDto dto);
	public BoardDto read(String B_no);
	public void write(WriteDto dto);
	public void modify(BoardDto dto);
	public void del(String B_no);
	public int hit(String B_no);
	public int replyCount(String B_no);
	public int delReplyCount(String B_no);

}

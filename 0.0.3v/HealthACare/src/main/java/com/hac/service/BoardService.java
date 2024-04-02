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
<<<<<<< HEAD
	public int searchTotalContent(BoardSDto dto);
	public PagingProcessor pageBlock(int currentPage,BoardSDto dto);
=======
	public PagingProcessor pageBlock(int currentPage,String word);
<<<<<<< HEAD

=======
>>>>>>> 295020fb9567452ce94731ceba0882f84ee8711c
>>>>>>> d83c94dd0b35a7ec3b2ebc1ac9a25d9207798569
	public BoardDto read(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public void del(long bno);
	public int hit(long bno);

}

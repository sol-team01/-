package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.process.PagingProcessor;
public interface BoardService {
	public ArrayList<BoardDto> getList(int currentPage);
	public ArrayList<BoardSDto> searchList(int currentPage, String word);
	public int totalContent();
	public PagingProcessor pageBlock(int currentPage,String word);
<<<<<<< HEAD

=======
>>>>>>> 2994f51b46ade34234e5f90570d7b3151d9d8cf1
	public BoardDto read(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public void del(long bno);
	public int hit(long bno);
<<<<<<< HEAD

=======
>>>>>>> 2994f51b46ade34234e5f90570d7b3151d9d8cf1
}

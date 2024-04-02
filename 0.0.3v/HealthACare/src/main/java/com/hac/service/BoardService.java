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
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 29fc4aa72bd12b36257ef8cfd7ff285e1a8157f9
	public BoardDto read(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public void del(long bno);
	public int hit(long bno);
<<<<<<< HEAD
=======

>>>>>>> 3721dc38d9a3621bccef62a819ef7b863136daa8
>>>>>>> adc40ecb0e103bdc166230867215e5a1b67730ba
=======
>>>>>>> 29fc4aa72bd12b36257ef8cfd7ff285e1a8157f9
}

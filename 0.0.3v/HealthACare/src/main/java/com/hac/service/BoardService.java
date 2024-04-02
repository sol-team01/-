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
>>>>>>> 0c8542e69fffc2e4638cc0f2c1884b8e32b706a8
	public BoardDto read(long bno);
	public void write(BoardDto dto);
	public void modify(BoardDto dto);
	public void del(long bno);
	public int hit(long bno);

}

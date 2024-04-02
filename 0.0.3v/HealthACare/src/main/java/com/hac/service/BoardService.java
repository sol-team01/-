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
}
=======

}

>>>>>>> 3721dc38d9a3621bccef62a819ef7b863136daa8

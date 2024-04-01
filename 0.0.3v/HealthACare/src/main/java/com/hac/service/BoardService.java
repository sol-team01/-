package com.hac.service;

<<<<<<< HEAD
import java.util.ArrayList;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.process.PagingProcessor;

public interface BoardService {
	public ArrayList<BoardDto> getList(int currentPage);
	public ArrayList<BoardSDto> searchList(int currentPage, String word);
	public int totalContent();
	public PagingProcessor pageBlock(int currentPage,String word);
=======
public class BoardService {
>>>>>>> c4e62d34593752906926764d73c4cf0d310ab7de
}

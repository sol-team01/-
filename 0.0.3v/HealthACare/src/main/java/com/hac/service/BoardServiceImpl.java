package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.searchDto.WriteDto;
import com.hac.mapper.BoardMapper;
import com.hac.process.PagingProcessor;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	//최신 공지사항 2개까지 홈화면에 출력
	@Override
	public ArrayList<BoardDto> getListNoticeHome(){
		return mapper.getListNoticeHome();
	}
	
	//최신글 4개까지 홈 화면에 출력
	@Override
	public ArrayList<BoardDto> getListReadHome(){
		return mapper.getListReadHome();
	}
	
	//인기글 조회수 순으로 홈에 출력
	@Override
	public ArrayList<BoardDto> popularPost(){
		return mapper.popularPost();
	}
	
	//마이페이지 나의활동에 게시판 연동하기
	@Override
	public ArrayList<BoardDto> myBoardList(String U_no){
		return mapper.myBoardList(U_no);
	}

	@Override
	public ArrayList<BoardDto> getList(int currentPage,int sort) {
		int limitIndex = (currentPage - 1) * 7;
		return mapper.getList(limitIndex,sort);
	}

	@Override
	public ArrayList<BoardDto> getNoticeList() {
		return mapper.getNoticeList();
	}

	@Override
	public ArrayList<BoardSDto> searchList(int currentPage, String word, String column) {
		int limitIndex = (currentPage - 1) * 7;
		BoardSDto search = new BoardSDto();
		search.setLimitIndex(limitIndex);
		search.setWord(word);
		search.setColumn(column);
		return mapper.searchList(search);
	}

	@Override
	public PagingProcessor pageBlock(int currentPage, BoardSDto dto) {
		PagingProcessor paging = new PagingProcessor(currentPage, mapper, dto);
		return paging;
	}

	@Override
	public int totalContent() {
		int totalContent = mapper.totalContent();
		return totalContent;
	}

	@Override
	public int searchTotalContent(BoardSDto dto) {
		int searchTotalContent = mapper.searchListCount(dto);
		System.out.println(searchTotalContent);
		return searchTotalContent;
	}

	@Override
	public BoardDto read(String B_no) {
		return mapper.read(B_no);
	}

	@Override
	public void del(String B_no) {
		mapper.del(B_no);
	}

	@Override
	public void write(WriteDto dto) {
		mapper.write(dto);
	}

	@Override
	public void modify(BoardDto dto) {
		mapper.modify(dto);
	}

	@Override
	public int hit(String B_no) {
		return mapper.hit(B_no);
	}
	
	@Override
	public int replyCount(String B_no) {
		return mapper.replyCount(B_no);
	}
	
	@Override
	public int delReplyCount(String B_no) {
		return mapper.delReplyCount(B_no);
	}

}

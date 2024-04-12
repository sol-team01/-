package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.searchDto.WriteDto;

public interface BoardMapper {
	//게시판 리스트 페이지 블록 적용
	public ArrayList<BoardDto> getList(@Param("limitIndex")int limitIndex,@Param("sort")int sort);
	public ArrayList<BoardDto> getNoticeList();
	public ArrayList<BoardDto> getNoticeListFull(int limitIndex);
	public ArrayList<BoardSDto> searchList(BoardSDto dto);
	//홈 메인화면 게시판 공지사항 최신순으로 보이게 하기 
	public ArrayList<BoardDto> getListNoticeHome();
	//홈 메인화면 게시판 글 최신순으로 보이게 하기 
	public ArrayList<BoardDto> getListReadHome();
	//인기글 출력
	public ArrayList<BoardDto> popularPost();
	//마이페이지 나의 활동 기록에 게시판 글 연동하기
	public ArrayList<BoardDto> myBoardList(String U_no);
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

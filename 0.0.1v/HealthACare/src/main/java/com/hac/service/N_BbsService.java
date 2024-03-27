package com.hac.service;

import org.springframework.ui.Model;
// 0.0.1v - C - 비회원 게시판 환경 구축용 인터페이스 생성
public interface N_BbsService {
	public Model getList(int currentPage, Model model); //[1]리스트
//	public GuestDto read(long bno); //[2]읽기
//	public void del(long bno);	//[3]삭제
//	public void write(GuestDto dto);//[4].방명록-write
//	public void modify(GuestDto dto);//[5].방명록-modify
}

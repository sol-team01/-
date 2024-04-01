package com.hac.process;

import com.hac.mapper.BoardMapper;

public class PagingProcessor {
	
	private BoardMapper mapper;
	
	public int totalPage = 0;
	public int currentPage = 0;
	int totalBlock = 0;
	int currentBlockNo = 0;
	int blockStartNo = 0;
	int blockEndNo = 0;
	int prevPage = 0;
	int nextPage = 0;
	String word = "";
	boolean ablePrev = true;
	boolean ableNext = true;
	
	public PagingProcessor(int currentPage,BoardMapper mapper,String word) {
		this.mapper = mapper;
		this.currentPage = currentPage;
		this.word = word;
		if(word == null) {
			this.totalPage = getPageCount();
		} else {
			this.totalPage = getSearchCount(word);
		}
		
		totalBlock = (int) Math.ceil((double) totalPage / 5);
		currentBlockNo = (int) Math.ceil((double) currentPage / 5);
		blockStartNo = (currentBlockNo - 1) * 5 + 1;
		blockEndNo = currentBlockNo * 5;
		if (blockEndNo > totalPage) {
			blockEndNo = totalPage;
		}
			if (currentBlockNo == 1) {
				ablePrev = false;
			} else {
				ablePrev = true;
				int prevPageAdd = (currentBlockNo - 1) * 5;
				prevPage = prevPageAdd;
			}
			if (currentBlockNo < totalBlock) {
				ableNext = true;
				int nextPageAdd = currentBlockNo * 5 + 1;
				nextPage = nextPageAdd;
			} else {
				ableNext = false;
			}
	}
	
	public int getPageCount() {
		int totalPageCount = 0;
		int count = mapper.totalContent();
		if(count % 5 == 0) {
			totalPageCount = count / 5;
		} else {
			totalPageCount = count / 5 + 1;
		}
		return totalPageCount;
	}
	
	public int getSearchCount(String word) {
		int totalPageCount = 0;
		int count = mapper.searchListCount(word);
		if (count % 5 == 0) {
			totalPageCount = count / 5;
		} else {
			totalPageCount = count / 5 + 1;
		}
		return totalPageCount;
	}
	
	public String getHtmlPageList() {
		String html = "";
		if(totalPage == getPageCount()) {
			if(ablePrev) {
				html = html + String.format("<a href='/board/BoardList?currentPage=%d'>이전</a>&nbsp;",prevPage);
			}
			for(int i = blockStartNo; i<=blockEndNo; i++) {
				html = html + String.format("<a href='/board/BoardList?&currentPage=%d'>%d</a>&nbsp;&nbsp;",i,i);
			}
			if(ableNext) {
				html = html + String.format("<a href='/board/BoardList?currentPage=%d'>다음</a>",nextPage);
			}
		}else {
			if(ablePrev) {
				html=html+String.format("<a href='/board/BoardSearch?currentPage=%d&word=%s'>이전</a>",prevPage,word);
			}
			for(int i = blockStartNo;i<=blockEndNo;i++) {
				html = html + String.format("<a href='/board/BoardSearch?&currentPage=%d&word=%s'>%d</a>&nbsp;&nbsp;",i,word,i);
			}
			if(ableNext) {
				html=html+String.format("<a href='/board/BoardSearch?currentPage=%d&word=%s'>다음</a>",nextPage,word);
			}
			
		}
		return html;
	}

}

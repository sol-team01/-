package com.hac.process;

import com.hac.dto.boardDto.BoardSDto;
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
	
	public PagingProcessor(int currentPage,BoardMapper mapper,BoardSDto dto) {
		this.mapper = mapper;
		this.currentPage = currentPage;
		if(dto.getWord().equals("")) {
			this.totalPage = getPageCount();
		} else {
			this.totalPage = getSearchCount(dto);
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
		if(count % 7 == 0) {
			totalPageCount = count / 7;
		} else {
			totalPageCount = count / 7 + 1;
		}
		return totalPageCount;
	}
	
	public int getSearchCount(BoardSDto dto) {
		int totalPageCount = 0;
		int count = mapper.searchListCount(dto);
		if (count % 7 == 0) {
			totalPageCount = count / 7;
		} else {
			totalPageCount = count / 7 + 1;
		}
		return totalPageCount;
	}
	
	public String getHtmlPageList() {
	    String html = "";
	    // 페이지 목록 생성
	    for (int i = blockStartNo; i <= blockEndNo; i++) {
	        html = html + String.format("<a href='/board/noticeBoard?&currentPage=%d'>%d</a>&nbsp;&nbsp;", i, i);
	    }
	    return html;
	}
	
	public String getPrevPageButton() {
	    String prevPageButton = "";
	    // 이전 페이지 버튼 생성
	    if (ablePrev) {
	    	prevPageButton += String.format("<a href='/board/noticeBoard?currentPage=%d'>이전</a>", prevPage);
	    }
	    return prevPageButton;
	}
	

	
	public String getNextPageButton() {
	    String nextPageButton = "";
	    // 다음 페이지 버튼 생성
	    if (ableNext) {
	    	nextPageButton += String.format("<a href='/board/noticeBoard?currentPage=%d'>다음</a>", nextPage);
	    }
	    return nextPageButton;
	}
	    
    public String goToFirstPage() {
        String firstPageButton = "";
        // 첫 번째 페이지로 이동하는 버튼 생성
        if (currentPage != 1) {
            firstPageButton = "<a href='/board/noticeBoard?currentPage=%d'>첫페이지</a>";
        }
        return firstPageButton;
    }
    
    public String goToLastPage() {
        String lastPageButton = "";
        // 마지막 페이지로 이동하는 버튼 생성
        if (!ableNext) {
        	if (currentPage != totalPage) {
        		lastPageButton = "<a href='/board/noticeBoard?currentPage=" + totalPage + "'>끝페이지</a>";
        	}
        }
        return lastPageButton;
    }

}

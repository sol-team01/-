package com.hac.process;

import com.hac.mapper.ReplyMapper;

public class ReplyPagingProcessor {
	
	private ReplyMapper mapper;
	
	public long replyTotalPage = 0;
	public long replyCurrentPage = 0;
	String B_no;
	long totalBlock = 0;
	long currentBlockNo = 0;
	long blockStartNo = 0;
	long blockEndNo = 0;
	long prevPage = 0;
	long nextPage = 0;
	boolean ablePrev = true;
	boolean ableNext = true;
	

	
	public ReplyPagingProcessor(long replyCurrentPage,ReplyMapper mapper,String B_no) {
		this.mapper = mapper;
		this.replyCurrentPage = replyCurrentPage;
		this.B_no = B_no;
		this.replyTotalPage = getReplyPageCount(B_no);

		totalBlock = (int) Math.ceil((double) replyTotalPage / 5);
		currentBlockNo = (int) Math.ceil((double) replyCurrentPage / 5);
		blockStartNo = (currentBlockNo - 1) * 5 + 1;
		blockEndNo = currentBlockNo * 5;
		if (blockEndNo > replyTotalPage) {
			blockEndNo = replyTotalPage;
		}
			if (currentBlockNo == 1) {
				ablePrev = false;
			} else {
				ablePrev = true;
				long prevPageAdd = (currentBlockNo - 1) * 5;
				prevPage = prevPageAdd;
			}
			if (currentBlockNo < totalBlock) {
				ableNext = true;
				long nextPageAdd = currentBlockNo * 5 + 1;
				nextPage = nextPageAdd;
			} else {
				ableNext = false;
			}
	}
	
	public long getReplyPageCount(String bno) {
		long totalPageCount = 0;
		long count = mapper.totalReply(B_no);
		if(count % 10 == 0) {
			totalPageCount = count / 10;
		} else {
			totalPageCount = count / 10 + 1;
		}
		return totalPageCount;
	}
	
	public String getHtmlReplyPageList() {
	    String html = "";
	    // 페이지 목록 생성
	    for (long i = blockStartNo; i <= blockEndNo; i++) {
	        if (i == replyCurrentPage) {
	            // 현재 페이지에는 링크를 걸지 않음
	            html = html + String.format("<div class='aaa'>%d</div>&nbsp;&nbsp;", i);
	        } else {
	            html = html + String.format("<a href='/board/readBoard?B_no=%s&replyCurrentPage=%d'>%d</a>&nbsp;&nbsp;", B_no, i, i);
	        }
	    }
	    return html;
	}
	
	public String getReplyPrevPageButton() {
	    String prevPageButton = "";
	    // 이전 페이지 버튼 생성
	    if (ablePrev) {
	        prevPageButton += String.format("<a href='/board/readBoard?B_no=%s&replyCurrentPage=%d'>Previous</a>", B_no, prevPage);
	    }
	    return prevPageButton;
	}
	

	
	public String getReplyNextPageButton() {
	    String nextPageButton = "";
	    // 다음 페이지 버튼 생성
	    if (ableNext) {
	        nextPageButton += String.format("<a href='/board/readBoard?B_no=%s&replyCurrentPage=%d'>Next</a>", B_no, nextPage);
	    }
	    return nextPageButton;
	}
	    
    public String goReplyToFirstPage() {
        String firstPageButton = "";
        // 첫 번째 페이지로 이동하는 버튼 생성
        	if (replyCurrentPage != 1) {
        		firstPageButton += String.format("<a href='/board/readBoard?B_no=%s&replyCurrentPage=%d'></a>", B_no, 1);
        	}
        return firstPageButton;
    }
    
    public String goReplyToLastPage() {
        String lastPageButton = "";
        // 마지막 페이지로 이동하는 버튼 생성
        if (replyTotalPage != 1 && replyTotalPage > 0) {
            if (replyCurrentPage != replyTotalPage) {
                lastPageButton += String.format("<a href='/board/readBoard?B_no=%s&replyCurrentPage=" + replyTotalPage + "'></a>", B_no);
            }
        }
        return lastPageButton;
    }
}

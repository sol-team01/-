package com.hac.process;

import com.hac.mapper.ReplyMapper;

public class ReplyPagingProcessor {
	
	private ReplyMapper mapper;
	
	public long replyTotalPage = 0;
	public long replyCurrentPage = 0;
	long bno;
	long totalBlock = 0;
	long currentBlockNo = 0;
	long blockStartNo = 0;
	long blockEndNo = 0;
	long prevPage = 0;
	long nextPage = 0;
	boolean ablePrev = true;
	boolean ableNext = true;
	

	
	public ReplyPagingProcessor(long replyCurrentPage,ReplyMapper mapper,long bno) {
		this.mapper = mapper;
		this.replyCurrentPage = replyCurrentPage;
		this.replyTotalPage = getReplyPageCount(bno);
		this.bno = bno;

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
	
	public long getReplyPageCount(long bno) {
		long totalPageCount = 0;
		long count = mapper.totalReply(bno);
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
    		html = html + String.format("<a href='/board/readBoard?b_NO=%d&replyCurrentPage=%d'>%d</a>&nbsp;&nbsp;", bno, i, i);
    	}
	    return html;
	}
	
	public String getReplyPrevPageButton() {
	    String prevPageButton = "";
	    // 이전 페이지 버튼 생성
	    if (ablePrev) {
	    		prevPageButton += String.format("<a href='/board/readBoard?b_NO=%d&replyCurrentPage=%d'>이전</a>", bno, prevPage);
	    }
	    return prevPageButton;
	}
	

	
	public String getReplyNextPageButton() {
	    String nextPageButton = "";
	    // 다음 페이지 버튼 생성
	    if (ableNext) {
	    		nextPageButton += String.format("<a href='/board/readBoard?b_NO=%d&replyCurrentPage=%d'>다음</a>", bno, nextPage);
	    }
	    return nextPageButton;
	}
	    
    public String goReplyToFirstPage() {
        String firstPageButton = "";
        // 첫 번째 페이지로 이동하는 버튼 생성
        	if (replyCurrentPage != 1) {
        		firstPageButton += String.format("<a href='/board/readBoard?b_NO=%d&replyCurrentPage=%d'>첫페이지</a>", bno, 1);
        	}
        return firstPageButton;
    }
    
    public String goReplyToLastPage() {
        String lastPageButton = "";
        // 마지막 페이지로 이동하는 버튼 생성
        if (replyTotalPage != 1 && replyTotalPage > 0) {
            if (replyCurrentPage != replyTotalPage) {
                lastPageButton += String.format("<a href='/board/readBoard?b_NO=%d&replyCurrentPage=" + replyTotalPage + "'>끝페이지</a>", bno);
            }
        }
        return lastPageButton;
    }
}

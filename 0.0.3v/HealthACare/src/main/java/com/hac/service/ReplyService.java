package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.boardDto.ReplyDto;
import com.hac.process.ReplyPagingProcessor;
public interface ReplyService {
	public ArrayList<ReplyDto> replyList(long replyCurrentPage,String B_no);
	public long totalReply(String B_no);
	public ReplyPagingProcessor replyPageBlock(long replyCurrentPage,String B_no);
	public void replyWrite(ReplyDto dto);
	public void replyModify(ReplyDto dto);
	public void replyDel(String R_no);
	public int replyHit(String R_no);
}

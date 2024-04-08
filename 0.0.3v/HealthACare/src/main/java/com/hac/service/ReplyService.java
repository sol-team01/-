package com.hac.service;

import java.util.ArrayList;

import com.hac.dto.boardDto.ReplyDto;
import com.hac.process.ReplyPagingProcessor;
public interface ReplyService {
	public ArrayList<ReplyDto> replyList(long replyCurrentPage,long bno);
	public long totalReply(long bno);
	public ReplyPagingProcessor replyPageBlock(long replyCurrentPage,long bno);
	public void replyWrite(ReplyDto dto);
	public void replyModify(ReplyDto dto);
	public void replyDel(long rno);
	public int replyHit(long rno);
}

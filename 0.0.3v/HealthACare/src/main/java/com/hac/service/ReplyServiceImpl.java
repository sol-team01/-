package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hac.dto.boardDto.ReplyDto;
import com.hac.mapper.ReplyMapper;
import com.hac.process.ReplyPagingProcessor;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Override
	public ArrayList<ReplyDto> replyList(long replyCurrentPage,long bno) {
		long replyLimitIndex = (replyCurrentPage - 1) * 10;
		return mapper.replyList(replyLimitIndex,bno);
	}

	@Override
	public ReplyPagingProcessor replyPageBlock(long replyCurrentPage,long bno) {
		ReplyPagingProcessor replyPaging = new ReplyPagingProcessor(replyCurrentPage, mapper, bno);
		return replyPaging;
	}

	@Override
	public long totalReply(long bno) {
		long totalReply = mapper.totalReply(bno);
		return totalReply;
	}

	@Override
	public void replyDel(long rno) {
		mapper.replyDel(rno);
	}

	@Override
	public void replyWrite(ReplyDto dto) {
		mapper.replyWrite(dto);
	}

	@Override
	public void replyModify(ReplyDto dto) {
		mapper.replyModify(dto);
	}

	@Override
	public int replyHit(long rno) {
		return mapper.replyHit(rno);
	}
}

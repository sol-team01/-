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
	public ArrayList<ReplyDto> replyList(long replyCurrentPage,String B_no) {
		long replyLimitIndex = (replyCurrentPage - 1) * 10;
		return mapper.replyList(replyLimitIndex,B_no);
	}

	@Override
	public ReplyPagingProcessor replyPageBlock(long replyCurrentPage,String B_no) {
		ReplyPagingProcessor replyPaging = new ReplyPagingProcessor(replyCurrentPage, mapper, B_no);
		return replyPaging;
	}

	@Override
	public long totalReply(String B_no) {
		long totalReply = mapper.totalReply(B_no);
		return totalReply;
	}

	@Override
	public void replyDel(String R_no) {
		mapper.replyDel(R_no);
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
	public int replyHit(String R_no) {
		return mapper.replyHit(R_no);
	}
}

package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.boardDto.ReplyDto;

public interface ReplyMapper {
	public ArrayList<ReplyDto> replyList(@Param("replyLimitIndex")long replyLimitIndex,@Param("bno")long bno);
	public long totalReply(@Param("bno")long bno);
	public void replyDel(long rno);
	public void replyWrite(ReplyDto dto);
	public void replyModify(ReplyDto dto);
	public int replyHit(long rno);
}

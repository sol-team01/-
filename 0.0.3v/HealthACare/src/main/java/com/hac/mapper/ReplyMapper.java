package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.boardDto.BoardDto;
import com.hac.dto.boardDto.BoardSDto;
import com.hac.dto.boardDto.ReplyDto;

public interface ReplyMapper {
	public ArrayList<ReplyDto> replyList(@Param("replyLimitIndex")long replyLimitIndex,@Param("B_no")String B_no);
	public long totalReply(@Param("B_no")String B_no);
	public void replyDel(String R_no);
	public void replyWrite(ReplyDto dto);
	public void replyModify(ReplyDto dto);
	public int replyHit(String R_no);
}

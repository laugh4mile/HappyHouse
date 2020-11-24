package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.NoticeDto;
@Mapper
public interface NoticeDao {
	public List<NoticeDto> selectBoard();
	public NoticeDto selectBoardByNo(int no);
	public int insertBoard(NoticeDto board);
	public int updateBoard(NoticeDto board);
	public int deleteBoard(int no);
}
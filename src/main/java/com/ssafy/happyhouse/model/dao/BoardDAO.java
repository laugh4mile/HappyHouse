package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.BoardDto;
@Mapper
public interface BoardDAO {
	public List<BoardDto> selectBoard();
	
	public BoardDto selectBoardByNo(int no);
	public int insertBoard(BoardDto board);
	public int updateBoard(BoardDto board);
	public int deleteBoard(int no);
}
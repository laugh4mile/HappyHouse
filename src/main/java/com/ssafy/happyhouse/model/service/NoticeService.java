package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.NoticeDto;

public interface NoticeService {
	public List<NoticeDto> retrieveBoard();
	public NoticeDto detailBoard(int no);
	public boolean writeBoard(NoticeDto board);
	public boolean updateBoard(NoticeDto board);
	public boolean deleteBoard(int no);
}

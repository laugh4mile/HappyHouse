package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.dao.BoardDAO;
import com.ssafy.happyhouse.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
    @Autowired
	private NoticeDao noticeDao;

    @Override
	public List<NoticeDto> retrieveBoard() {
		return noticeDao.selectBoard();
	}
    
  	@Override
	public boolean writeBoard(NoticeDto board) {
		return noticeDao.insertBoard(board) == 1;
	}

	@Override
	public NoticeDto detailBoard(int no) {
		return noticeDao.selectBoardByNo(no);
	}

	@Override
	@Transactional
	public boolean updateBoard(NoticeDto board) {
		return noticeDao.updateBoard(board) == 1;
	}

	@Override
	@Transactional
	public boolean deleteBoard(int no) {
		return noticeDao.deleteBoard(no) == 1;
	}
}
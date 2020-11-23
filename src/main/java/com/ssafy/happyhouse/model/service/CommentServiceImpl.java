package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommentDto;
import com.ssafy.happyhouse.model.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<CommentDto> commentListService() throws Exception {
		return commentDao.commentList();
	}

	@Override
	public int commentInsertService(CommentDto comment) throws Exception {
		return commentDao.commentInsert(comment);
	}

	@Override
	public int commentUpdateService(CommentDto comment) throws Exception {
		return commentDao.commentUpdate(comment);
	}

	@Override
	public int commentDeleteService(int cno) throws Exception {
		return commentDao.commentDelete(cno);
	}

}

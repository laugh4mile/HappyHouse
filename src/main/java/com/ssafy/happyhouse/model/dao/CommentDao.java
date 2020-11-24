package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CommentDto;
@Mapper
public interface CommentDao {
	 // 댓글 개수
    public int commentCount() throws Exception;
 
//    // 댓글 목록
//    public List<CommentDto> commentList() throws Exception;
    // 댓글 목록
    public List<CommentDto> commentList(int bno) throws Exception;
 
    // 댓글 작성
    public int commentInsert(CommentDto comment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(CommentDto comment) throws Exception; 
 
    // 댓글 삭제
    public int commentDelete(int cno) throws Exception;


}
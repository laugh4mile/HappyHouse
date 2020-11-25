package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommentDto;
import com.ssafy.happyhouse.model.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/list/{bno}") //댓글 리스트
	@ResponseBody
	private List<CommentDto> nCommentServiceList(@PathVariable int bno, Model model) throws Exception{
//		System.out.println("bno기준으로 댓글리스트 출력");
		return commentService.commentListService(bno);
	}
	
//	@RequestMapping("/list") //댓글 리스트
//    @ResponseBody
//    private List<CommentDto> mCommentServiceList(Model model) throws Exception{
//        System.out.println("걍 댓글리스트");
//        System.out.println(model);
//        return commentService.commentListService();
//    }

	@RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int bno, @RequestParam String content,  @RequestParam String writer) throws Exception{
        System.out.println("insert comment");
		CommentDto comment = new CommentDto();
        comment.setBno(bno);
        comment.setContent(content);
        // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 
        // 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
        comment.setWriter(writer);  
        
        return commentService.commentInsertService(comment);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
    	System.out.println("update comment");
        CommentDto comment = new CommentDto();
        comment.setCno(cno);
        comment.setContent(content);
        
        return commentService.commentUpdateService(comment); 
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
    	System.out.println("delete comment");
        return commentService.commentDeleteService(cno);
    }


}
package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.service.BoardService;
import com.ssafy.happyhouse.model.service.NoticeService;



@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value = "/list")
	private String list() {
		return "dist/index";
	}
	
	@ResponseBody
	@GetMapping(value = "/boards", headers = { "Content-type=application/json" })
	public List<NoticeDto> retrieveBoard() {
		return noticeService.retrieveBoard();
	}
	
	@GetMapping("{no}")
	//?주소 -> 쿼리스트링 받는 것
	// {nd} -> 파라메터를 받는 것
	public String getPost(@PathVariable int no, Model model) {
		model.addAttribute("postDetailRespDto", noticeService.detailBoard(no));
		return "dist/noticeDetail"; 
	}
	
	@GetMapping(value = "/goWrite")
	private String goWrite() {
		return "dist/noticeWrite";
	}
	
	@ResponseBody
	@PostMapping(value = "/regi", headers = { "Content-type=application/json" })
	public List<NoticeDto> boardRegister(@RequestBody NoticeDto boardDto) {
		System.out.println("등록 되냐?");
		System.out.println(boardDto);
		noticeService.writeBoard(boardDto);
		return noticeService.retrieveBoard();
	}
	
	@ResponseBody
	@DeleteMapping(value = "/delete/{no}",headers = { "Content-type=application/json" })
	public List<NoticeDto> boardDelete(@PathVariable("no") int no) {
		System.out.println("컨트롤러 - delete");
		noticeService.deleteBoard(no);
		return noticeService.retrieveBoard();
	}
	
	@ResponseBody
	@PutMapping(value = "/modi", headers = { "Content-type=application/json" })
	public List<NoticeDto> boardModify(@RequestBody NoticeDto boardDto) {
		System.out.println("보드컨트롤러 - modify");
		System.out.println(boardDto);
		noticeService.updateBoard(boardDto);
		return noticeService.retrieveBoard();
	}
	
	@PostMapping
	public ResponseEntity<String> writeBoard(@RequestBody NoticeDto board) {
		logger.debug("writeBoard - 호출"); 
		if (noticeService.writeBoard(board)) { 
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	
	@PutMapping("{no}")
	public ResponseEntity<String> updateBoard(@PathVariable int no, @RequestBody NoticeDto board) {
		logger.debug("updateBoard - 호출");
		logger.debug("" + board);
		board.setNo(no);
		
		if (noticeService.updateBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteBoard(@PathVariable int no) {
		logger.debug("deleteBoard - 호출");
		if (noticeService.deleteBoard(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
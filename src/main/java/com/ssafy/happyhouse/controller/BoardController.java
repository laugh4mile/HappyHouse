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
import com.ssafy.happyhouse.model.service.BoardService;



@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "/list")
	private String list() {
		return "dist/qnaBoard";
	}
	
	@ResponseBody
	@GetMapping(value = "/boards", headers = { "Content-type=application/json" })
	public List<BoardDto> retrieveBoard() {
		return boardService.retrieveBoard();
	}
	
	@GetMapping("{no}")
	//?주소 -> 쿼리스트링 받는 것
	// {nd} -> 파라메터를 받는 것
	public String getPost(@PathVariable int no, Model model) {
		model.addAttribute("postDetailRespDto", boardService.detailBoard(no));
		return "dist/qnaDetail"; 
	}
	
	@GetMapping(value = "/goWrite")
	private String goWrite() {
		return "dist/qnaWrite";
	}
	
	
	@PostMapping
	public ResponseEntity<String> writeBoard(@RequestBody BoardDto board) {
		logger.debug("writeBoard - 호출"); 
		if (boardService.writeBoard(board)) { 
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@PutMapping("{no}")
	public ResponseEntity<String> updateBoard(@PathVariable int no, @RequestBody BoardDto board) {
		logger.debug("updateBoard - 호출");
		logger.debug("" + board);
		board.setNo(no);
		
		if (boardService.updateBoard(board)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteBoard(@PathVariable int no) {
		logger.debug("deleteBoard - 호출");
		if (boardService.deleteBoard(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
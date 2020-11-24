package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.InterestsDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.InterestsService;

@Controller
@RequestMapping("/interests")
public class InterestsController {
	@Autowired
	private InterestsService interestsService;

	@GetMapping(value = "/list")
	public String list(HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		List<InterestsDto> result;
		
		System.out.println(memberDto);
		
		try {
			result = interestsService.getInterestsList(memberDto.getEmail());
			System.out.println(result);
			model.addAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관심목록을 불러오던 중 오류가 발생했습니다.");
			return "error/error";
		}

		return "dist/InterestsList";
	}
	
//	@ResponseBody
//	@PostMapping(value="/insert")
//	public  void insert(@RequestBody HouseDealDto house, HttpSession session) {
//		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
//
//		
//	}
	
	@ResponseBody
	@PostMapping(value="/delete")
	public String insert(@RequestBody String aptNo, HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		int no = Integer.parseInt(aptNo);

		try {
			interestsService.delete(memberDto.getEmail(), no);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관심목록을 삭제하던 중 오류가 발생했습니다.");
			return "error/error";
		}

		return "succress";

		
	}
	
	
	
	
	

}

package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.InterestsDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.InterestsService;

@Controller
@RequestMapping("/interests")
public class InterestsController {
//	@Autowired
//	private InterestsService interestsService;

	@GetMapping(value = "/list")
	public String list(HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		List<InterestsDto> result;
		
		System.out.println(memberDto);
		
//		try {
//			result = interestsService.getInterestsList();
//
//			model.addAttribute("result", result);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "관심목록을 불러오던 중 오류가 발생했습니다.");
//			return "error/error";
//		}

		return "dist/InterestsList";
	}

}

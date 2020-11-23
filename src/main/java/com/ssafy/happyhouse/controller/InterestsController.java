package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ssafy.happyhouse.model.service.InterestsService;

@Controller
@RequestMapping("/interests")
public class InterestsController {
//	@Autowired
//	private InterestsService interestsService;

	@GetMapping(value = "/list")
	public String test3() {
		return "dist/InterestsList";
	}

}

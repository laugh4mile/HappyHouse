package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.PollutionService;

@Controller
@RequestMapping("/pollution")
public class PollutionController {

	@Autowired
	private PollutionService pollutionService;
	
	@GetMapping(value = "", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getSido() throws Exception {
		System.out.println(pollutionService.getSido());
		return pollutionService.getSido();
	}

	@ResponseBody
	@GetMapping(value = "/{sido}", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) throws Exception {
		System.out.println(pollutionService.getGugunInSido(sido));
		return pollutionService.getGugunInSido(sido);
	}


	@GetMapping(value = "/PollutionMap")
	public String listAptRent() {
		return "dist/PollutionMap";
	}
}

package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.PollutionDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.CommercialService;

@Controller
@RequestMapping("/commercial")
public class CommercialController {

	@Autowired
	private CommercialService commercialService;

	@ResponseBody
	@GetMapping(value = "", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getSido() throws Exception {
		System.out.println("Commercial : " + commercialService.getSido().get(0).getSidoName());
		return commercialService.getSido();
	}

	@ResponseBody
	@GetMapping(value = "/{sido}", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) throws Exception {
		System.out.println("Commercial : " + commercialService.getGugun(sido).get(0).getGugunName());
		return commercialService.getGugun(sido);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}", headers = { "Content-type=application/json" })
	public List<CommercialDto> getDong(@PathVariable String gugun) throws Exception {
		System.out.println("Commercial : " + commercialService.getDong(gugun).get(0).getDong());
		return commercialService.getDong(gugun);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}/{dong}", headers = { "Content-type=application/json" })
	public List<CommercialDto> getCommercial(@PathVariable String dong) throws Exception {
		System.out.println("Commercial : " + commercialService.getCommercial(dong));
		return commercialService.getCommercial(dong);
	}

	@GetMapping(value = "/CommercialMap")
	public String listAptRent() {
		return "dist/CommercialMap";
	}
}

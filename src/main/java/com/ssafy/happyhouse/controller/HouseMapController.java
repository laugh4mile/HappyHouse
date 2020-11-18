package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.HouseMapService;

@Controller
@RequestMapping("/map")

public class HouseMapController {

	@Autowired
	private HouseMapService houseMapService;

	@ResponseBody
	@GetMapping(value = "", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getSido() throws Exception{
		System.out.println(houseMapService.getSido());
		return houseMapService.getSido();
	}

	@ResponseBody
	@GetMapping(value = "/{sido}", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) throws Exception{
		System.out.println(houseMapService.getGugunInSido(sido));
		return houseMapService.getGugunInSido(sido);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}", headers = {"Content-type=application/json"})
	public List<HouseInfoDto> getDong(@PathVariable String gugun) throws Exception{
		return houseMapService.getDongInGugun(gugun);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}/{dong}/{type}", headers = {"Content-type=application/json"})
	public List<HouseDealDto> getAptInType(@PathVariable String dong, @PathVariable String type) throws Exception{
		return houseMapService.getAptInType(dong, type);
	}

	@GetMapping(value = "/APTRent")
	public String listAptRent() {
		return "dist/APTRent";
	}

	@GetMapping(value = "/JuRent")
	public String listJuRent() {
		return "dist/JuRent";
	}

	@GetMapping(value = "/Jumeme")
	public String listJuMeme() {
		return "dist/Jumeme";
	}

	@GetMapping(value = "/APTmeme")
	public String listAPTMeme() {
		return "dist/APTmeme";
	}

	@GetMapping(value = "/searchResult")
	public String list(String key, String word, Model model) {
		if(key == null) key="";
		if(word == null)  word="";
		key=key.trim();
		word = "%" + word.trim() + "%";
		
		System.out.println(key + " " + word);
		
		List<HouseDealDto> result = null;
		
		try {
			switch(key){
			case "dong":			
				result=houseMapService.getAptMemeInDong(word);
				result.addAll(houseMapService.getAptRentInDong(word));
				result.addAll(houseMapService.getJuMemeInDong(word));
				result.addAll(houseMapService.getJuRentInDong(word));				
				break;
			case "name":
				result=houseMapService.getAptMemeInName(word);
				result.addAll(houseMapService.getAptRentInName(word));
				result.addAll(houseMapService.getJuMemeInName(word));
				result.addAll(houseMapService.getJuRentInName(word));
				break;
			}
			
			model.addAttribute("result", result );
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","검색 중 오류가 발생했습니다." );
			return "error/error";
		}
		
		System.out.println(result);
		
		return "dist/searchResult";
	}

}
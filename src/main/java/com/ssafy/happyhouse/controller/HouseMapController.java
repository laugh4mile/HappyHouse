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
	@GetMapping(value = "", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getSido() throws Exception {
		System.out.println(houseMapService.getSido());
		return houseMapService.getSido();
	}

	@ResponseBody
	@GetMapping(value = "/{sido}", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) throws Exception {
		System.out.println(houseMapService.getGugunInSido(sido));
		return houseMapService.getGugunInSido(sido);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}", headers = { "Content-type=application/json" })
	public List<HouseInfoDto> getDong(@PathVariable String gugun) throws Exception {
		return houseMapService.getDongInGugun(gugun);
	}

	@ResponseBody
	@GetMapping(value = "/{sido}/{gugun}/{dong}/{type}", headers = { "Content-type=application/json" })
	public List<HouseDealDto> getAptInType(@PathVariable String dong, @PathVariable String type) throws Exception {
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

	@GetMapping(value = "/searchRoad")
	public String searchRoad() {
		return "dist/searchRoad";
	}

	@GetMapping(value = "/index")
	public String index() {
		return "dist/index";
	}

	@GetMapping(value = "/roadView")
	public String test1() {
		return "dist/roadView";
	}

	@GetMapping(value = "traffic")
	public String test2() {
		return "dist/traffic";
	}

	@GetMapping(value = "/circleDistance")
	public String test3() {
		return "dist/circleDistance";
	}

	@GetMapping(value = "/searchResult")
	public String list(String key, String word, Model model) {
		if (key == null)
			key = "";
		if (word == null)
			word = "";
		key = key.trim();
		System.out.println(key + " " + word);

		List<HouseDealDto> result = null;

		try {
			String search = "%" + word.trim() + "%";

			switch (key) {
			case "dong":
				result = houseMapService.getAllInDong(search);
				break;
			case "name":
				result = houseMapService.getAllInName(search);
				break;
			}

			model.addAttribute("word", word);
			model.addAttribute("result", result);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "검색 중 오류가 발생했습니다.");
			return "error/error";
		}

		return "dist/searchResult";
	}
	
	@GetMapping(value = "/detailedInfo")
	public String info(int no, Model model) {
		System.out.println(no);
		
		HouseDealDto info = null;

        try {
            info = houseMapService.search(no);    
            System.out.println(info);
            model.addAttribute("info", info);

        } catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "검색 중 오류가 발생했습니다.");
			return "error/error";
        }		
	
		return "dist/detailedInfo";
	}
	
	@GetMapping(value = "/search")
	public String search() {
		return "dist/search";
	}

}
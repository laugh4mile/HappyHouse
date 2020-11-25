package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.InterestsDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.HouseMapService;
import com.ssafy.happyhouse.model.service.InterestsService;

@Controller
@RequestMapping("/interests")
public class InterestsController {
	@Autowired
	private InterestsService interestsService;
	@Autowired
	private HouseMapService houseMapService;

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
	
	@PostMapping(value = "/insert", headers = { "Content-type=application/json" })
	@ResponseBody
	public ResponseEntity<Void> insert(@RequestParam String email, @RequestParam int aptNo) {
		System.out.println(aptNo);
		
		HouseDealDto house;
		InterestsDto interestDto;
		
		try {
			house = houseMapService.search(aptNo);
			System.out.println(house);
			
			interestDto = new InterestsDto();
			interestDto.setEmail(email);
			interestDto.setDongcode(house.getCode());
			interestDto.setDongName(house.getDong());
			interestDto.setAptNo(Integer.toString(aptNo));
			interestDto.setAptName(house.getAptName());
			
			System.out.println("insert");
			System.out.println(interestDto);
			
			interestsService.insert(interestDto);		
		}catch(Exception e){
			e.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.OK);
	}

	@DeleteMapping(value = "/delete", headers = { "Content-type=application/json" })
	@ResponseBody
	public ResponseEntity<Void> delete(@RequestParam String email, @RequestParam int aptNo) {
		InterestsDto interestDto;
		try {
			interestDto = new InterestsDto();
			interestDto.setEmail(email);
			interestDto.setAptNo(Integer.toString(aptNo));
			
			interestsService.delete(interestDto);
		}catch(Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.OK);
	}

}

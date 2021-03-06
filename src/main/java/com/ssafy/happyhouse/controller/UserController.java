package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;	
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.LoginService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
	private LoginService loginService;


	@GetMapping(value = "/list")
	private String list() {
		return "dist/list";
	}
	
	@ResponseBody
	@GetMapping(value = "/users", headers = { "Content-type=application/json" })
	public List<MemberDto> userList() {
		return loginService.userList();
	}

	@ResponseBody
	@PostMapping(value = "/regi", headers = { "Content-type=application/json" })
	public List<MemberDto> userRegister(@RequestBody MemberDto memberDto) {
		System.out.println(memberDto.getEmail());
		loginService.userRegister(memberDto);
		return loginService.userList();
	}

	@ResponseBody
	@PutMapping(value = "/modi", headers = { "Content-type=application/json" })
	public List<MemberDto> userModify(@RequestBody MemberDto memberDto) {
		loginService.userModify(memberDto);
		return loginService.userList();
	}
	
	@ResponseBody
	@DeleteMapping(value = "/delete/{email}",headers = { "Content-type=application/json" })
	public List<MemberDto> userDelete(@PathVariable("email") String email, HttpSession session) {
		loginService.userDelete(email);
		return loginService.userList();
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "dist/index";
	}

	@PostMapping(value="/login")
	private String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = loginService.login(map);
			System.out.println(memberDto);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				Cookie cookie = new Cookie("ssafy_id", memberDto.getEmail());
				cookie.setPath("/");
				if(memberDto.getEmail().equals(map.get("email"))) {
					cookie.setMaxAge(60*5);//5??? ??????.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				
							
				return "dist/index";
				
			} else {
				model.addAttribute("msg", "????????? ?????? ???????????? ?????? ??? ???????????? ?????????.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "????????? ??? ????????? ??????????????????.");
			return "error/error";
		}
		return "dist/login";
	}
	


	@RequestMapping(value = "/find_pw_form", method = RequestMethod.GET)
	public String find_pw_form() throws Exception{
		return "/dist/password";
	}
	
	@RequestMapping(value = "/find_pwd", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("pwd", loginService.find_pwd(email));
		return "/dist/find_pwd";
	}
	
	@GetMapping(value="/lookup")
	private String lookupMember(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:dist/mypage";
	}
	
	@GetMapping(value="/search")
	private String searchMember(HttpServletRequest request, HttpServletResponse response) {
		return "";
	}
	

	@GetMapping(value="/logout")
	private String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value="/mypage")
	private String mypage() {
		return "/dist/mypage";
	}
}

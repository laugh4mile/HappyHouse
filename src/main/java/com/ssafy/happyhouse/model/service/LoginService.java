package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;
import com.ssafy.happyhouse.model.MemberDto;

public interface LoginService {
	public MemberDto login(Map<String, String> map) throws Exception;

	public List<MemberDto> userList();

	public void userRegister(MemberDto memberDto);
	public void userModify(MemberDto memberDto);
	public void userDelete(String userid);
}

package com.ssafy.happyhouse.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.MemberDto;

@Mapper
public interface LoginDao {
	public List<MemberDto> userList();
	
	public MemberDto login(String email, String userpwd) throws Exception;

	public MemberDto login(Map<String, String> map) throws Exception;

	public void userRegister(MemberDto memberDto);

	public void userModify(MemberDto memberDto);

	public void userDelete(String userid);
	
	public int update_pw(MemberDto memberDto) throws Exception;
	
	public String find_pwd(String email) throws Exception;
}

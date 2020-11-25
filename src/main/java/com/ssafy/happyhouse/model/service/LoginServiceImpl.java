package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.dao.LoginDao;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
	LoginDao loginDao;

    @Override
    public List<MemberDto> userList() {
    	// TODO Auto-generated method stub
    	return loginDao.userList();
    }
    
	@Override
	public MemberDto login(Map<String, String> map) throws Exception {
		if(map.get("email") == null || map.get("userpwd") == null)
			return null;
//		return loginDao.login(map.get("email"), map.get("userpwd"));
		return loginDao.login(map);
	}

	@Override
	public void userRegister(MemberDto memberDto) {
		// TODO Auto-generated method stub
		loginDao.userRegister(memberDto);
		
	}

	@Override
	public void userModify(MemberDto memberDto) {
		// TODO Auto-generated method stub
		loginDao.userModify(memberDto);
		
	}

	@Override
	public void userDelete(String userid) {
		loginDao.userDelete(userid);
	}

	@Override
	public int update_pw(MemberDto memberDto) throws Exception {
		return loginDao.update_pw(memberDto);
	}

	@Override
	public String find_pwd(String email) throws Exception {
		return loginDao.find_pwd(email);
	}
}

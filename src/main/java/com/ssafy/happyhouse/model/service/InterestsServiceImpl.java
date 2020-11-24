package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.InterestsDto;
import com.ssafy.happyhouse.model.dao.InterestsDao;
@Service
public class InterestsServiceImpl implements InterestsService{
	@Autowired
	private InterestsDao interestsDao;	
	
	@Override
	public List<InterestsDto> getInterestsList(String email) {
		return interestsDao.getInterestsList(email);
	}


	@Override
	public void delete(int no) {
		interestsDao.delete(no);
	}


	@Override
	public void insert(InterestsDto interestDto) {
		interestsDao.insert(interestDto);
	}
	
}

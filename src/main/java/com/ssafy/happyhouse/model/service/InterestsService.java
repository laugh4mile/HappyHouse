package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.InterestsDto;

public interface InterestsService {
	List<InterestsDto> getInterestsList(String email);
	void delete(String email, int no);
}

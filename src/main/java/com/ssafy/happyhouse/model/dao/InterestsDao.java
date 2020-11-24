package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.InterestsDto;
@Mapper
public interface InterestsDao {

	public List<InterestsDto> getInterestsList(String email);

	public void delete(InterestsDto interestDto);

	public void insert(InterestsDto interestDto);

}

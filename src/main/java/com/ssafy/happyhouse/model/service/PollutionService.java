package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface PollutionService {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	
}

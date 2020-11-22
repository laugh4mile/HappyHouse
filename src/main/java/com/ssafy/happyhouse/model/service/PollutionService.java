package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.PollutionDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface PollutionService {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugun(String sido) throws Exception;
	List<PollutionDto> getDong(String gugun) throws Exception;
	List<PollutionDto> getPollution(String dong) throws Exception;
}

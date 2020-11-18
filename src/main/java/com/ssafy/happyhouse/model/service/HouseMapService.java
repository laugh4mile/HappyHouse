package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface HouseMapService {
	
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getAptMemeInDong(String dong) throws Exception;
	List<HouseDealDto> getJuMemeInDong(String dong);
	List<HouseDealDto> getAptRentInDong(String dong);
	List<HouseDealDto> getJuRentInDong(String dong);
	List<HouseDealDto> getAptMemeInName(String apt);
	List<HouseDealDto> getAptInType(String dong, String type);
	
}

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
	List<HouseDealDto> getJuMemeInDong(String dong) throws Exception;
	List<HouseDealDto> getAptRentInDong(String dong) throws Exception;
	List<HouseDealDto> getJuRentInDong(String dong) throws Exception;
	List<HouseDealDto> getAptMemeInName(String apt) throws Exception;
	List<HouseDealDto> getJuMemeInName(String apt) throws Exception;
	List<HouseDealDto> getAptRentInName(String apt) throws Exception;
	List<HouseDealDto> getJuRentInName(String apt) throws Exception;
	List<HouseDealDto> getAptInType(String dong, String type) throws Exception;
	HouseDealDto search(int no);
	
}

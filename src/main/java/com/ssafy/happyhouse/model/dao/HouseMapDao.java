package com.ssafy.happyhouse.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

@Mapper
public interface HouseMapDao {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getAptMemeInDong(String dong);
	List<HouseDealDto> getJuMemeInDong(String dong);
	List<HouseDealDto> getAptRentInDong(String dong);
	List<HouseDealDto> getJuRentInDong(String dong);
	List<HouseDealDto> getAptMemeInName(String apt);
	List<HouseDealDto> getAptInType(String dong, String type);
}

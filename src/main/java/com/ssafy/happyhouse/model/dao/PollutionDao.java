package com.ssafy.happyhouse.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.happyhouse.model.PollutionDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

@Mapper
public interface PollutionDao {
	
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugun(String sido) throws Exception;
	List<PollutionDto> getDong(String gugun) throws Exception;
	List<PollutionDto> getPollution(String dong) throws Exception;
}

package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

@Mapper
public interface CommercialDao {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugun(String sido) throws Exception;
	List<CommercialDto> getDong(String gugun) throws Exception;
	List<CommercialDto> getCommercial(String dong) throws Exception;
	
}

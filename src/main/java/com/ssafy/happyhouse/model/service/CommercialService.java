package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface CommercialService {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugun(String sido) throws Exception;
	List<CommercialDto> getDong(String gugun) throws Exception;
	List<CommercialDto> getCommercial(String dong) throws Exception;
}

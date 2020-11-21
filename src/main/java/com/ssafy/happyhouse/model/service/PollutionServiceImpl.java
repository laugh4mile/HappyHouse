package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.dao.PollutionDao;

@Service
public class PollutionServiceImpl implements PollutionService{
    
	@Autowired
    private PollutionDao pollutiondao;
	
	private PollutionServiceImpl() {}

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return pollutiondao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugun(String sido) throws Exception {
		return pollutiondao.getGugun(sido);
	}

}

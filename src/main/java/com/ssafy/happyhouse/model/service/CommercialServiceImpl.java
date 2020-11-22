package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommercialDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.dao.CommercialDao;

@Service
public class CommercialServiceImpl implements CommercialService {

	@Autowired
	private CommercialDao commercialdao;

	private CommercialServiceImpl() {
	}

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return commercialdao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugun(String sido) throws Exception {
		return commercialdao.getGugun(sido);
	}

	@Override
	public List<CommercialDto> getDong(String gugun) throws Exception {
		return commercialdao.getDong(gugun);
	}

	@Override
	public List<CommercialDto> getCommercial(String dong) throws Exception {
		return commercialdao.getPollution(dong);
	}

}

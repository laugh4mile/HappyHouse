package com.ssafy.happyhouse.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.dao.HouseMapDao;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
//    @Autowired
//	private static HouseMapService houseMapService;
    
    @Autowired
    private HouseMapDao housemapdao;
	
	private HouseMapServiceImpl() {}
	
//	public static HouseMapService getHouseMapService() {
//		if(houseMapService == null)
//			houseMapService = new HouseMapServiceImpl();
//		return houseMapService;
//	}

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return housemapdao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return housemapdao.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return housemapdao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return housemapdao.getAptInDong(dong);
	}

	@Override
	public List<HouseDealDto> getAptMemeInDong(String dong) throws Exception {
		return housemapdao.getAptMemeInDong(dong);
	}

	@Override
	public List<HouseDealDto> getAptMemeInName(String apt) throws Exception {
		return housemapdao.getAptMemeInName(apt);
	}

	@Override
	public List<HouseDealDto> getJuMemeInDong(String dong) throws Exception  {
		return housemapdao.getJuMemeInDong(dong);
	}

	@Override
	public List<HouseDealDto> getAptRentInDong(String dong) throws Exception  {
		return housemapdao.getAptRentInDong(dong);
	}

	@Override
	public List<HouseDealDto> getJuRentInDong(String dong) throws Exception {
		return housemapdao.getJuRentInDong(dong);
	}

	@Override
	public List<HouseDealDto> getJuMemeInName(String apt) throws Exception {
		return housemapdao.getJuMemeInName(apt);
	}

	@Override
	public List<HouseDealDto> getAptRentInName(String apt) throws Exception {
		return housemapdao.getAptRentInName(apt);
	}

	@Override
	public List<HouseDealDto> getJuRentInName(String apt) throws Exception {
		return housemapdao.getJuRentInName(apt);
	}
	
	@Override
	public List<HouseDealDto> getAptInType(String dong, String type) throws Exception {
		return housemapdao.getAptInType(dong, type);		
	}

	@Override
	public HouseDealDto search(int no) {
		return housemapdao.search(no);
	}
}

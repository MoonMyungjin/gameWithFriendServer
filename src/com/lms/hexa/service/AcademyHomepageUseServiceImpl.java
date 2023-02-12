package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dao.AcademyHomepageUseDAO;
import com.lms.hexa.dao.AcademyinfoDAO;
import com.lms.hexa.dao.SchoolDAO;
import com.lms.hexa.dto.AcademyHomepageUseVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyHomepageUseServiceImpl implements AcademyHomepageUseService {
	
	protected AcademyHomepageUseDAO academyHomepageUseDAO;

	public void setAcademyHomepageUseDAO(AcademyHomepageUseDAO academyHomepageUseDAO) {
		this.academyHomepageUseDAO = academyHomepageUseDAO;
		
	}

	@Override
	public AcademyHomepageUseVO insert() throws SQLException {
		AcademyHomepageUseVO result = academyHomepageUseDAO.insert();
		return result;
	}

	@Override
	public void insertHomeUseImpo(AcademyHomepageUseVO HomeImpo) throws SQLException {
		academyHomepageUseDAO.insertHomeUseImpo(HomeImpo);
		
	}

	@Override
	public Map<String, Object> selectMenuNameList() throws SQLException {
		List<AcademyHomepageUseVO> selectAcademyHomepageUse = academyHomepageUseDAO.selectAcademyHomepageUse();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("selectAcademyHomepageUse", selectAcademyHomepageUse);
		return dataMap;
	}
	

}

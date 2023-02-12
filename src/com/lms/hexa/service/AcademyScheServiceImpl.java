package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dao.AcademyScheDAO;
import com.lms.hexa.dao.AcademyinfoDAO;
import com.lms.hexa.dao.SchoolDAO;
import com.lms.hexa.dto.AcademyScheVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public class AcademyScheServiceImpl implements AcademyScheService {
	
	protected AcademyScheDAO academyScheDAO;

	public void setAcademyScheDAO(AcademyScheDAO academyScheDAO) {
		this.academyScheDAO = academyScheDAO;
	}


	@Override
	public Map<String, Object> selectAcademyScheList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<AcademyScheVO> academyScheList = academyScheDAO.selectAcademyUpScheList();
		List<AcademyScheVO> academySubScheList = academyScheDAO.selectAcademyScheList();
		
		dataMap.put("academyScheList",academyScheList);
		dataMap.put("academySubScheList",academySubScheList);
		return dataMap;
	}


	@Override
	public int registAcademyUpSche(HashMap<String, Object> params) throws SQLException {
		
		int result = academyScheDAO.insertAcademyUpSche(params);
		return result;
	}


	@Override
	public void deleteAcademyUpSche(HashMap<String, Object> params) throws SQLException {
		academyScheDAO.deleteAcademyUpSche(params);
		
	}


	@Override
	public int registAcademySche(HashMap<String, Object> params) throws SQLException {
		int result = academyScheDAO.insertAcademySche(params);
		return result;
	}


	@Override
	public void updateAcademyCal(HashMap<String, Object> params) throws SQLException {
		academyScheDAO.updateAcademyCal(params);
		
	}


	@Override
	public void updateAcademyResize(HashMap<String, Object> params) throws SQLException {
		academyScheDAO.updateAcademyResize(params);
		
	}


	@Override
	public void updateAcademyDetail(HashMap<String, Object> params) throws SQLException {
		
		academyScheDAO.updateAcademyDetail(params);
		
	}


	@Override
	public void deleteAcademyDetail(HashMap<String, Object> params) throws SQLException {
		academyScheDAO.deleteAcademyDetail(params);
		
	}




}

package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.SchoolDAO;
import com.lms.hexa.dto.SchoolVO;

public class SchoolServiceImpl implements SchoolService {
	
	protected SchoolDAO schoolDAO;

	public void setSchoolDAO(SchoolDAO schoolDAO) {
		this.schoolDAO = schoolDAO;
	}

	@Override
	public Map<String, Object> selectSchoolList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SchoolVO> school = schoolDAO.selectschoolList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		dataMap.put("school", school);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public int registSchool(HashMap<String, Object> params) throws SQLException {
		int result = schoolDAO.insertSchool(params);
		
		return result;
	}

	@Override
	public void deleteSchool(HashMap<String, Object> params) throws SQLException {
		schoolDAO.deleteSchool(params);
		
	}

	@Override
	public void updateSchool(HashMap<String, Object> params) throws SQLException {
		schoolDAO.updateSchool(params);
		
	}

	@Override
	public List<SchoolVO> selectSimpleSchoolList() {
		List<SchoolVO> schoolList = schoolDAO.selectSimpleSchoolList();
		return schoolList;
	}

	

}

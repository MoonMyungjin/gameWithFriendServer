package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.SchoolVO;

public interface SchoolService {
	
	
	
	Map<String, Object> selectSchoolList(Criteria cri) throws SQLException;
	
	int registSchool(HashMap<String, Object> params) throws SQLException;
	
	void deleteSchool(HashMap<String, Object> params) throws SQLException;
	
	void updateSchool(HashMap<String, Object> params) throws SQLException;

	List<SchoolVO> selectSimpleSchoolList();
	
}

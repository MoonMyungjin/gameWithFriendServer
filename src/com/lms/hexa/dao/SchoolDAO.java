package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.SchoolVO;



public interface SchoolDAO {
	
	List<SchoolVO> selectschoolList(Criteria cri) throws SQLException;
	
	int insertSchool(HashMap<String, Object> params) throws SQLException;
	
	void deleteSchool(HashMap<String, Object> params) throws SQLException;
	
	void updateSchool(HashMap<String, Object> params) throws SQLException;

	List<SchoolVO> selectSimpleSchoolList();
}

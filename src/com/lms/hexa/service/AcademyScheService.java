package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.NoticeVO;

public interface AcademyScheService {

	Map<String, Object> selectAcademyScheList() throws SQLException;
	
	int registAcademyUpSche(HashMap<String, Object> params) throws SQLException;
	
	void deleteAcademyUpSche(HashMap<String, Object> params) throws SQLException;
	
	int registAcademySche(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyCal(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyResize(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyDetail(HashMap<String, Object> params) throws SQLException;
	
	void deleteAcademyDetail(HashMap<String, Object> params) throws SQLException;
}

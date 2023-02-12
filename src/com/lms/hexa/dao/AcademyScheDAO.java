package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.AcademyScheVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public interface AcademyScheDAO {
	
	List<AcademyScheVO> selectAcademyUpScheList() throws SQLException;
	
	List<AcademyScheVO> selectAcademyScheList() throws SQLException;
	
	int insertAcademyUpSche(HashMap<String, Object> params) throws SQLException;
	
	int insertAcademySche(HashMap<String, Object> params) throws SQLException;
	
	void deleteAcademyUpSche(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyCal(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyResize(HashMap<String, Object> params) throws SQLException;
	
	void updateAcademyDetail(HashMap<String, Object> params) throws SQLException;
	
	void deleteAcademyDetail(HashMap<String, Object> params) throws SQLException;
}

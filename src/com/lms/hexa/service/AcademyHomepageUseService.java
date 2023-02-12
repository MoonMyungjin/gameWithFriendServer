package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.AcademyHomepageUseVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.NoticeVO;

public interface AcademyHomepageUseService {

	AcademyHomepageUseVO insert() throws SQLException;
	
	
	public void insertHomeUseImpo(AcademyHomepageUseVO HomeImpo) throws SQLException;
	
	Map<String, Object> selectMenuNameList() throws SQLException;
}

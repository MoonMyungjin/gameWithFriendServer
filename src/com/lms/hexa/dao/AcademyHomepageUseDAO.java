package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.AcademyHomepageUseVO;
import com.lms.hexa.dto.AcademyinfoVO;
import com.lms.hexa.dto.SchoolVO;

public interface AcademyHomepageUseDAO {
	
	
	AcademyHomepageUseVO insert() throws SQLException;
	
	void insertHomeUseImpo(AcademyHomepageUseVO HomeImpo) throws SQLException;
	
	List<AcademyHomepageUseVO> selectAcademyHomepageUse() throws SQLException;
}

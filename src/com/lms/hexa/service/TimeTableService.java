package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dto.TimeTableSettingVO;
import com.lms.hexa.dto.TimeTableVO;

public interface TimeTableService {
	
	// 시간표 주중 세팅값 조회
	TimeTableSettingVO getWeekDaySettingvalue() throws SQLException;
	// 시간표 주말 세팅값 조회
	TimeTableSettingVO getWeekEndSettingvalue() throws SQLException;
	
	// 시간표 상세정보 가져오기
	Map<String,List<TimeTableVO>> getTimeTablevalue() throws SQLException;

	// 시간표 값 수정
	int modifyTimeTableValues(HashMap<String, Object> params) throws SQLException;
	
}

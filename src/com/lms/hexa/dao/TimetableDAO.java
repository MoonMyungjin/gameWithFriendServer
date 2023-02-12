package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.TimeTableSettingVO;
import com.lms.hexa.dto.TimeTableVO;

public interface TimetableDAO {

	// 시간표 주중 세팅값 조회
	TimeTableSettingVO selectWeekDaySettingvalue() throws SQLException;
	// 시간표 주말 세팅값 조회
	TimeTableSettingVO selectWeekEndSettingvalue() throws SQLException;
	
	// 주중 시간값 조회
	List<TimeTableVO> selectWeekDayTimeTableValue() throws SQLException;
	// 주말 시간값 조회
	List<TimeTableVO> selectWeekEndTimeTableValue() throws SQLException;
	
	// 주중 세팅값 수정
	void updateWeekDayTimeTableSetting(TimeTableSettingVO ttSettingVO) throws SQLException;
	// 주말 세팅값 수정
	void updateWeekEndTimeTableSetting(TimeTableSettingVO ttSettingVO) throws SQLException;
	
	// 시간표 값 삭제
	void deleteTimeTableValues(String category) throws SQLException;
	// 주중시간표 값 넣기
	int insertWeekDayNewTimeTableValues(List<TimeTableVO> timeTableList) throws SQLException;
	// 주말시간표 값 넣기
	int insertWeekEndNewTimeTableValues(List<TimeTableVO> timeTableList) throws SQLException;
	
}

package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.TimeTableSettingVO;
import com.lms.hexa.dto.TimeTableVO;

public class TimetableDAOImpl implements TimetableDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public TimeTableSettingVO selectWeekDaySettingvalue() throws SQLException {
		TimeTableSettingVO ttSettingVO = session.selectOne("TimeTable-Mapper.selectWeekDaySettingvalue");
		return ttSettingVO;
	}

	@Override
	public TimeTableSettingVO selectWeekEndSettingvalue() throws SQLException {
		TimeTableSettingVO ttSettingVO = session.selectOne("TimeTable-Mapper.selectWeekEndSettingvalue");
		return ttSettingVO;
	}
	
	@Override
	public List<TimeTableVO> selectWeekDayTimeTableValue() throws SQLException {
		List<TimeTableVO> weekDayList = session.selectList("TimeTable-Mapper.selectWeekDayTimeTableValue");
		return weekDayList;
	}
	
	@Override
	public List<TimeTableVO> selectWeekEndTimeTableValue() throws SQLException {
		List<TimeTableVO> weekEndList = session.selectList("TimeTable-Mapper.selectWeekEndTimeTableValue");
		return weekEndList;
	}


	@Override
	public void updateWeekDayTimeTableSetting(TimeTableSettingVO ttSettingVO) throws SQLException {
		session.update("TimeTable-Mapper.updateWeekDayTimeTableSetting",ttSettingVO);
	}

	@Override
	public void updateWeekEndTimeTableSetting(TimeTableSettingVO ttSettingVO) throws SQLException {
		session.update("TimeTable-Mapper.updateWeekEndTimeTableSetting",ttSettingVO);
	}
	
	@Override
	public void deleteTimeTableValues(String category) throws SQLException {
		session.insert("TimeTable-Mapper.deleteTimeTableValues",category);
	}

	@Override
	public int insertWeekDayNewTimeTableValues(List<TimeTableVO> timeTableList) throws SQLException {
		Map<String,Object> insertMap= new HashMap<String,Object>();
		insertMap.put("timeTableList", timeTableList);
		int result = session.insert("TimeTable-Mapper.insertWeekDayNewTimeTableValues", insertMap);
		return result;
	}

	@Override
	public int insertWeekEndNewTimeTableValues(List<TimeTableVO> timeTableList) throws SQLException {
		Map<String,Object> insertMap= new HashMap<String,Object>();
		insertMap.put("timeTableList", timeTableList);
		int result = session.insert("TimeTable-Mapper.insertWeekEndNewTimeTableValues", insertMap);
		return result;
	}


	
}

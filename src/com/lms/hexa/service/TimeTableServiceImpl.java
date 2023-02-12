package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dao.TimetableDAO;
import com.lms.hexa.dto.TimeTableSettingVO;
import com.lms.hexa.dto.TimeTableVO;

public class TimeTableServiceImpl implements TimeTableService{

	private TimetableDAO timeTableDAO;
	
	public void setTimeTableDAO(TimetableDAO timeTableDAO) {
		this.timeTableDAO = timeTableDAO;
	}

	@Override
	public TimeTableSettingVO getWeekDaySettingvalue() throws SQLException {
		TimeTableSettingVO ttsettingVO = timeTableDAO.selectWeekDaySettingvalue();
		return ttsettingVO;
	}

	@Override
	public TimeTableSettingVO getWeekEndSettingvalue() throws SQLException {
		TimeTableSettingVO ttsettingVO = timeTableDAO.selectWeekEndSettingvalue();
		return ttsettingVO;
	}

	@Override
	public Map<String,List<TimeTableVO>> getTimeTablevalue() throws SQLException {
		Map<String,List<TimeTableVO>> ttMap = new HashMap<String, List<TimeTableVO>>();
		
		List<TimeTableVO> weekDayList = timeTableDAO.selectWeekDayTimeTableValue();
		List<TimeTableVO> weekEndList = timeTableDAO.selectWeekEndTimeTableValue();
		ttMap.put("weekDayList",weekDayList);		
		ttMap.put("weekEndList",weekEndList);		
		
		return ttMap;
	}
	
	@Override
	public int modifyTimeTableValues(HashMap<String, Object> params) throws SQLException {
		int result = 0;
		List<TimeTableVO> timeTableList = (List<TimeTableVO>)params.get("timeList");
		TimeTableSettingVO ttSettingVO = new TimeTableSettingVO();
		HashMap<String,Object> ttmap = (HashMap<String,Object>)params.get("timeSettingInfo");
		
		ttSettingVO.setTtsettingStartTime((String)ttmap.get("ttsettingStartTime"));
		
		int a = (int)ttmap.get("ttsettingClassTime");
		ttSettingVO.setTtsettingClassTime(Integer.valueOf(a));
		a = (int)ttmap.get("ttsettingBreakTerm");
		ttSettingVO.setTtsettingBreakTerm(Integer.valueOf(a));
		a = (int)ttmap.get("ttsettingPeriodCount");
		ttSettingVO.setTtsettingPeriodCount(Integer.valueOf(a));
		
		String category = (String)params.get("category");
		
		//insert전 테이블 비우기
		timeTableDAO.deleteTimeTableValues(category);
		
		if(category.equals("weekDay")) {
			timeTableDAO.updateWeekDayTimeTableSetting(ttSettingVO);
			result = timeTableDAO.insertWeekDayNewTimeTableValues(timeTableList);
		} else {
			timeTableDAO.updateWeekEndTimeTableSetting(ttSettingVO);
			result = timeTableDAO.insertWeekEndNewTimeTableValues(timeTableList);
		}
		
		return result;
	}


}
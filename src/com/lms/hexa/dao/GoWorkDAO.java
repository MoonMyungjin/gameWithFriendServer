package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.dto.GoWorkVO;

public interface GoWorkDAO {
	
	public List<GoWorkVO> selectGoWorkListBySelectDay(String selectDay) throws SQLException;
	
	public List<GoWorkVO> selectGoWorkListBySelectMonthAndId(GoWorkVO work) throws SQLException;
	
	public void updateGoWorkTime(String id) throws SQLException;

	public void updateGoWorkOutTime(String id) throws SQLException;
	
	public void updateGoWorkTotalTime(String id) throws SQLException;
	
	public void updateGoWorkTotalTimeLate(String id) throws SQLException;
	
	public void insertDayGoWorkList(List<GoWorkVO> work) throws SQLException;
	
	public void updateGoWorkYes(String id) throws SQLException;
	
	public GoWorkVO selectTodayWorkStatusById(String id) throws SQLException;
	

	
	public GoWorkVO selectGoWorkListBySelectGetMain(GoWorkVO work) throws SQLException;

	public void changeGoWorkStatus(GoWorkVO work) throws SQLException;
	
	public void changeGoWorkOutStatus(GoWorkVO work) throws SQLException;
	
	public void changeGoWorkTotalTimeStatus(GoWorkVO work) throws SQLException;

	public void changeGoWorkReason(GoWorkVO work) throws SQLException;
	
}

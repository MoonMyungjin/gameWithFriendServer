package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.GoWorkVO;

public class GoWorkDAOImpl implements GoWorkDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<GoWorkVO> selectGoWorkListBySelectDay(String selectDay) throws SQLException {
		List<GoWorkVO> workList = session.selectList("GoWork-Mapper.selectGoWorkListBySelectDay",selectDay);
		return workList;
	}

	@Override
	public List<GoWorkVO> selectGoWorkListBySelectMonthAndId(GoWorkVO work) throws SQLException {
		List<GoWorkVO> workList = session.selectList("GoWork-Mapper.selectGoWorkListBySelectMonthAndId",work);
		return workList;
	}

	@Override
	public void updateGoWorkTime(String id) throws SQLException {
		session.update("GoWork-Mapper.updateGoWorkTime",id);
	}

	@Override
	public void updateGoWorkOutTime(String id) throws SQLException {
		session.update("GoWork-Mapper.updateGoWorkOutTime",id);
	}

	@Override
	public void updateGoWorkTotalTime(String id) throws SQLException {
		session.update("GoWork-Mapper.updateGoWorkTotalTime",id);
		
	}

	@Override
	public void insertDayGoWorkList(List<GoWorkVO> work) throws SQLException {
		session.insert("GoWork-Mapper.insertDayGoWorkList", work);
	}

	@Override
	public void updateGoWorkYes(String id) throws SQLException {
		session.update("GoWork-Mapper.updateGoWorkYes",id);
		
	}

	@Override
	public GoWorkVO selectTodayWorkStatusById(String id) throws SQLException {
		GoWorkVO workStatus = session.selectOne("GoWork-Mapper.selectTodayWorkStatusById",id);
		return workStatus;
	}

	@Override
	public void updateGoWorkTotalTimeLate(String id) throws SQLException {
		session.update("GoWork-Mapper.updateGoWorkTotalTimeLate",id);
	}


	@Override
	public GoWorkVO selectGoWorkListBySelectGetMain(GoWorkVO work) throws SQLException {
		GoWorkVO selectOne = session.selectOne("GoWork-Mapper.selectGoWorkListGetMain",work);
		return selectOne;
	}


	@Override
	public void changeGoWorkStatus(GoWorkVO work) throws SQLException {
		session.update("GoWork-Mapper.changeGoWorkStatus", work);
	}

	@Override
	public void changeGoWorkOutStatus(GoWorkVO work) throws SQLException {
		session.update("GoWork-Mapper.changeGoWorkOutStatus", work);
	}

	@Override
	public void changeGoWorkTotalTimeStatus(GoWorkVO work) throws SQLException {
		session.update("GoWork-Mapper.changeGoWorkTotalTimeStatus", work);
	}

	@Override
	public void changeGoWorkReason(GoWorkVO work) throws SQLException {
		session.update("GoWork-Mapper.changeGoWorkReason", work);
	}

}

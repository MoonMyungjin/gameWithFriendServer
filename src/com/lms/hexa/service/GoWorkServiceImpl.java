package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.hexa.dao.GoWorkDAO;
import com.lms.hexa.dao.ManagerDAO;
import com.lms.hexa.dto.GoWorkVO;
import com.lms.hexa.dto.ManagerVO;

public class GoWorkServiceImpl implements GoWorkService {

	private GoWorkDAO goWorkDAO;
	private ManagerDAO managerDAO;
	
	public void setGoWorkDAO(GoWorkDAO goWorkDAO) {
		this.goWorkDAO = goWorkDAO;
	}
	
	public void setManagerDAO(ManagerDAO managerDao) {
		this.managerDAO = managerDao;
	}
	
	
	@Override
	public List<GoWorkVO> selectGoWorkListBySelectDay(String selectDay) throws SQLException {
		List<GoWorkVO> workList = goWorkDAO.selectGoWorkListBySelectDay(selectDay);
		return workList;
	}

	@Override
	public List<GoWorkVO> selectGoWorkListBySelectMonthAndId(GoWorkVO work) throws SQLException {
		List<GoWorkVO> workList = goWorkDAO.selectGoWorkListBySelectMonthAndId(work);
		return workList;
	}

	@Override
	public void insertDayGoWorkList() throws SQLException {
		List<GoWorkVO> workDayList = new ArrayList<GoWorkVO>();
		
		try {
			List<ManagerVO> managerList = managerDAO.selectManagerListForGoWork();
			for (int i = 0; i < managerList.size(); ++i) {
				GoWorkVO workManager = new GoWorkVO();
				ManagerVO manager = managerList.get(i);
				String mngId = manager.getId();
				workManager.setMngId(mngId);
				System.out.println("managerId"+workManager.getMngId());
				
				workDayList.add(i, workManager);
			}
			
			goWorkDAO.insertDayGoWorkList(workDayList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateGoWorkTime(String id) throws SQLException {
		goWorkDAO.updateGoWorkTime(id);
	}

	@Override
	public void updateGoWorkOutTime(String id) throws SQLException {
		goWorkDAO.updateGoWorkOutTime(id);
	}

	@Override
	public void updateGoWorkTotalTime(String id) throws SQLException {
		goWorkDAO.updateGoWorkTotalTime(id);
	}

	@Override
	public void updateGoWorkYes(String id) throws SQLException {
		goWorkDAO.updateGoWorkYes(id);
	}

	@Override
	public GoWorkVO selectTodayWorkStatusById(String id) throws SQLException {
		GoWorkVO workStatus = goWorkDAO.selectTodayWorkStatusById(id);
		return workStatus;
	}

	@Override
	public void updateGoWorkTotalTimeLate(String id) throws SQLException {
		goWorkDAO.updateGoWorkTotalTimeLate(id);
	}

	@Override
	public void changeGoWorkStatus(GoWorkVO work) throws SQLException {
		goWorkDAO.changeGoWorkStatus(work);
		goWorkDAO.changeGoWorkTotalTimeStatus(work);
	}

	@Override
	public void changeGoWorkOutStatus(GoWorkVO work) throws SQLException {
		goWorkDAO.changeGoWorkOutStatus(work);
	}

	@Override
	public void changeGoWorkReason(GoWorkVO work) throws SQLException {
		goWorkDAO.changeGoWorkReason(work);
	}

}

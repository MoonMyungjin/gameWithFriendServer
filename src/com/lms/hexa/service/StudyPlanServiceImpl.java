package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dao.StudyPlanDAO;
import com.lms.hexa.dto.StudyPlanVO;


public class StudyPlanServiceImpl implements StudyPlanService {

	private StudyPlanDAO studyPlanDAO;
	
	public void setStudyPlanDAO(StudyPlanDAO studyPlanDAO) {
		this.studyPlanDAO = studyPlanDAO;
	}

	
//	@Override
//	public StudyPlanVO getStudyPlan(int splanId) throws SQLException {
//		StudyPlanVO studyPlan = studyPlanDAO.selectNoticeByNno(splanId);
//		return studyPlan;
//	}
//	
//	
	
//	@Override
//	public Map<String, Object> getList(Criteria cri) throws SQLException {
//
//	
//		Map<String, Object> dataMap = new HashMap<String, Object>();
//		dataMap.put("noticeList", noticeList);
//		
//
//		return dataMap;
//	}
//
	  
	  
	  
//	  @Override
//	  public void modify(StudyPlanVO studyPlan) throws SQLException {
//	  
//		  studyPlanDAO.updateStudyPlan(studyPlan);
//	  }
	  
//	  @Override 
//	  public void remove(int splanId) throws SQLException {
//	  
//		  studyPlanDAO.deleteStudyPlan(splanId); 
//	  
//	  }


	@Override
	public int regist(HashMap<String, Object> params) throws SQLException {
	
	 int sPlanid = studyPlanDAO.getSeqNextValue();
	 params.put("sPlanid", sPlanid);
	 
	 int result2 = 0;
	 int result3 = 0;
	 
	 
	/* studyPlan 부분은 MAP이 아니라서 MERGE INTO 구현으로 따로 update 안해도 됨 */
	 int checkResult = studyPlanDAO.selectSPlanExist(params);
	 if(checkResult>0) {
		 result2 = studyPlanDAO.updateSubjectStudyPlan(params);
		 result3 = studyPlanDAO.updateDateStudyPlan(params);
	 } else {
		 result2 = studyPlanDAO.insertSubjectStudyPlan(params);
		 result3 = studyPlanDAO.insertDateStudyPlan(params);
	 }
	 	
	 int result = studyPlanDAO.insertStudyPlan(params);
	 
	 
	 int fResult = result + result2 + result3;
	 
	return fResult; 
	
	}

	
	
	
	@Override
	public StudyPlanVO getStudyPlanWeek(StudyPlanVO studyPlan) throws SQLException {
		
		StudyPlanVO studyPlanval = studyPlanDAO.selectStudyPlanWeek(studyPlan);
		
		return studyPlanval;
	}

	@Override
	public List<StudyPlanVO> getSubjectStudyPlanWeekList(StudyPlanVO studyPlan) {
		
		List<StudyPlanVO> subjectStudyPlanWeekList = null;
		try {
			subjectStudyPlanWeekList = studyPlanDAO.selectSubjectStudyPlanWeekList(studyPlan);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return subjectStudyPlanWeekList;
		
		

	}

	@Override
	public List<StudyPlanVO> getDateStudyPlanWeekList(StudyPlanVO studyPlan) {
		
		
		List<StudyPlanVO> dateStudyPlanWeekList = null;
		try {
			dateStudyPlanWeekList = studyPlanDAO.selectDateStudyPlanWeekList(studyPlan);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dateStudyPlanWeekList;
		
		

	}


	@Override
	public List<StudyPlanVO> getStudentList(String mngId) {
		
		List<StudyPlanVO> studentList = null;
		try {
			studentList = studyPlanDAO.selectStudentList(mngId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return studentList;
		
	}


	@Override
	public List<StudyPlanVO> getPStudentList(String parentId) {
		List<StudyPlanVO> pStudentList = null;
		try {
			pStudentList = studyPlanDAO.selectPStudentList(parentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pStudentList;
	}






	

}

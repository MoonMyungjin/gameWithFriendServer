package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;


import com.lms.hexa.dto.StudyPlanVO;





public class StudyPlanDAOImpl implements StudyPlanDAO{

	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}



//	@Override
//	public List<StudyPlanVO> selectStudyPlanList(StudyPlanVO studyPlan) throws SQLException {
//		List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.selectStudyPlanList", studyPlan);
//		return list;
//	}


	
//	  @Override public List<StudyPlanVO> selectStudyPlanBySplanId(int splanId) throws SQLException {
//		  List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.selectStudyPlanBySplanId", splanId);
//	       return list; 
//	  }
	 

	@Override
	public int insertStudyPlan(HashMap<String, Object> params) throws SQLException {
		int result =  session.insert("StudyPlan-Mapper.insertStudyPlan", params);
		return result;
	}

	@Override
	public int insertSubjectStudyPlan(HashMap<String, Object> params) throws SQLException {
		int result =  session.insert("StudyPlan-Mapper.insertSubjectStudyPlan", params);
		return result;
	}
	
	
	@Override
	public int insertDateStudyPlan(HashMap<String, Object> params) throws SQLException {
		int result =  session.insert("StudyPlan-Mapper.insertDateStudyPlan", params);
		return result;
	}

	
	
	
//	@Override
//	public void updateStudyPlan(StudyPlanVO studyPlan) throws SQLException {
//		session.update("StudyPlan-Mapper.updateStudyPlan", studyPlan);
//		
//	}
//
//
//	@Override
//	public void deleteStudyPlan(int splanId) throws SQLException {
//		session.update("StudyPlan-Mapper.deleteStudyPlan", splanId);
//		
//	}





 
 	@Override
 	public int getSeqNextValue() throws SQLException {
 		int splanId = session.selectOne("StudyPlan-Mapper.selectStudyPlanSeqNext");
 		return splanId;
 	}



 	
 	@Override
	public StudyPlanVO selectStudyPlanWeek(StudyPlanVO studyPlan) throws SQLException {
 		StudyPlanVO studyPlanval = (StudyPlanVO)session.selectOne("StudyPlan-Mapper.studyPlan", studyPlan);
		return studyPlanval;
 		
 	}
 	
	@Override
	public List<StudyPlanVO> selectSubjectStudyPlanWeekList(StudyPlanVO studyPlan) throws SQLException {
		List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.subjectStudyPlanList", studyPlan);
		return list;
	}

	@Override
	public List<StudyPlanVO> selectDateStudyPlanWeekList(StudyPlanVO studyPlan) throws SQLException {
		List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.dateStudyPlanList", studyPlan);
		return list;
	}

	@Override
	public int selectSPlanExist(HashMap<String, Object> params) throws SQLException {
		int checkResult = 0;
		try {
			checkResult = session.selectOne("StudyPlan-Mapper.selectSPlanExist",params);
		} catch (NullPointerException e) {
			checkResult = 0;
		}
		return checkResult;
	}
	
	@Override
	public List<StudyPlanVO> selectStudentList(String mngId) throws SQLException {
		List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.selectStudent", mngId);
		return list;
	}
	
	
	@Override
	public List<StudyPlanVO> selectPStudentList(String parentId) throws SQLException {
		List<StudyPlanVO> list = session.selectList("StudyPlan-Mapper.selectPStudent", parentId);
		return list;
	}
	
	@Override
	public int updateSubjectStudyPlan(HashMap<String, Object> params) throws SQLException {
	
		int checkResult = session.update("StudyPlan-Mapper.updateSubjectStudyPlan",params);
		return checkResult;
	}

	@Override
	public int updateDateStudyPlan(HashMap<String, Object> params) throws SQLException {
		int checkResult = session.update("StudyPlan-Mapper.updateDateStudyPlan",params);
		return checkResult;
	}













	
}

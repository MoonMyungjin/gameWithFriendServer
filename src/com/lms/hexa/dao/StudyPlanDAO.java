package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import com.lms.hexa.dto.StudyPlanVO;


public interface StudyPlanDAO {

	
	StudyPlanVO selectStudyPlanWeek(StudyPlanVO studyPlan) throws SQLException;
	
	// list
	List<StudyPlanVO> selectSubjectStudyPlanWeekList(StudyPlanVO studyPlan) throws SQLException;
	
	List<StudyPlanVO> selectDateStudyPlanWeekList(StudyPlanVO studyPlan) throws SQLException;
	
	List<StudyPlanVO> selectStudentList(String mngId) throws SQLException;

	List<StudyPlanVO> selectPStudentList(String parentId) throws SQLException;
	
	
	/*
	 * // notice_id에 따른 자료 List<StudyPlanVO> selectStudyPlanBySplanId(int splanId)
	 * throws SQLException;
	 */

	
//	void updateStudyPlan(StudyPlanVO studyPlan) throws SQLException;
//	
//	void deleteStudyPlan(int splanId) throws SQLException;
	
	int getSeqNextValue() throws SQLException;

	int insertStudyPlan(HashMap<String, Object> params)throws SQLException;
	
	int insertSubjectStudyPlan(HashMap<String, Object> params)throws SQLException;
	
	int insertDateStudyPlan(HashMap<String, Object> params)throws SQLException;

	int selectSPlanExist(HashMap<String, Object> params)throws SQLException;

	int updateSubjectStudyPlan(HashMap<String, Object> params)throws SQLException;

	int updateDateStudyPlan(HashMap<String, Object> params)throws SQLException;

}

package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.StudyPlanVO;



public interface StudyPlanService {
	
	//리스트 조회
	//Map<String, Object> getList(Criteria cri) throws SQLException;
//	
//	// 글 조회
//	StudyPlanVO getStudyPlan(int splanId) throws SQLException;
	 
//	 void modify(StudyPlanVO studyPlan) throws SQLException;
	 
//	 void  remove(int splanId) throws SQLException;

	 int regist(HashMap<String, Object> params) throws SQLException;
	  
	 StudyPlanVO getStudyPlanWeek(StudyPlanVO studyPlan) throws SQLException;
	
	 List<StudyPlanVO> getSubjectStudyPlanWeekList(StudyPlanVO studyPlan);
	 
	 List<StudyPlanVO> getDateStudyPlanWeekList(StudyPlanVO studyPlan);

   	List<StudyPlanVO> getStudentList(String mngId);

   	List<StudyPlanVO> getPStudentList(String parentId);
	 

}

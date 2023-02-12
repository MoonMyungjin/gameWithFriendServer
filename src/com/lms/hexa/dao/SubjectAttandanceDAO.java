package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.SubjectAttendanceVO;

public interface SubjectAttandanceDAO {
	
	public List<SubjectAttendanceVO> selectBySubjectList(String lessonAssignmentId) throws SQLException;
	
	public List<SubjectAttendanceVO> selectBySubjectSearchList(Map<String,Object> sqlMap) throws SQLException;
	
	void insert(List<SubjectAttendanceVO> subjectAttendanceList) throws SQLException;
	
	void update(SubjectAttendanceVO subject) throws SQLException;
	
	void updateOut(SubjectAttendanceVO subject) throws SQLException;
	
	void updateAll(HashMap<String, Object> params) throws SQLException;
	
	void updateAllCancle(HashMap<String, Object> params) throws SQLException;
	
	void readyForInsertSubjectAtt (List<SubjectAttendanceVO> subjectAttendanceList) throws SQLException;

	List<SubjectAttendanceVO> forMainAjaxAtt(HashMap<String, Object> params) throws SQLException;
	
	
}

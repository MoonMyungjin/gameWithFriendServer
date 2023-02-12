package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.SubjectAttendanceVO;

public interface SubjectAttendanceService {
	
	
	public Map<String, Object> getByTeacherAttList(String lessonAssignmentId,Criteria cri) throws SQLException;
	
	public List<SubjectAttendanceVO> getByTeacherAttSearchList(Map<String,Object> sqlMap) throws SQLException;
	
	public void insertSubjectList() throws SQLException;
	
	public void updateSubject(SubjectAttendanceVO subjects) throws SQLException;
	
	public void updateOutSubject(SubjectAttendanceVO subjects) throws SQLException;
	
	public void updateAll(HashMap<String, Object> params) throws SQLException;
	
	public void updateAllCancle(HashMap<String, Object> params) throws SQLException;

	public List<SubjectAttendanceVO> forMainGetAttAjax(HashMap<String, Object> params) throws SQLException;
	
	
}

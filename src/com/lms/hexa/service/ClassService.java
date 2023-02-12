package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.StudentVO;

public interface ClassService {

	ClassVO selectClassById(String classId) throws SQLException;

	ClassVO getClassInfoByStudentId(String studentId);
	
	List<ClassVO> getClassList() throws SQLException;
	
	List<StudentVO> getStudentByClass(String className) throws SQLException;

	List<StudentVO> getNotIncludeStudentByClass(String className);

	void registBelongValues(HashMap<String, Object> params);

	int getClassMaxClassId();

	void updateclassInfo(HashMap<String, Object> params);
	
	
}

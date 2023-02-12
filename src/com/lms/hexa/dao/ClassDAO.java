package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.StudentVO;

public interface ClassDAO {
	
	ClassVO selectClassById(String classId) throws SQLException;
	
	ClassVO selectBelongById(String studnetId) throws SQLException;

	ClassVO selectClassInfoByStudentId(String studentId);
	
	List<ClassVO> selectClassList() throws SQLException;
	
	List<StudentVO> selectStudentByClass(String className) throws SQLException;

	List<StudentVO> selectNotIncludeStudentByClass(String className);

	void deleteBelongOldInfo(HashMap<String, Object> params);

	void InsertNewBelongInfo(HashMap<String, Object> params);

	int selectClassMaxClassId();

	void deleteBelongOldClassInfo(HashMap<String, Object> params);

	void deleteClassTableAll();

	void insertNewClassInfo(HashMap<String, Object> params);
}

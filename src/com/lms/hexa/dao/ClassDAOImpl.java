package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.StudentVO;

public class ClassDAOImpl implements ClassDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ClassVO selectClassById(String classId) throws SQLException {
		ClassVO result = session.selectOne("Class-Mapper.selectClassById", classId);
		return result;
	}

	@Override
	public ClassVO selectBelongById(String studnetId) throws SQLException {
		ClassVO result = session.selectOne("Class-Mapper.selectbelongById", studnetId);
		System.out.println(result);
		return result;
	}

	@Override
	public ClassVO selectClassInfoByStudentId(String studentId) {
		ClassVO classInfo = session.selectOne("Class-Mapper.selectClassInfoByStudentId", studentId);
		return classInfo;
	}

	@Override
	public List<ClassVO> selectClassList() throws SQLException {
		List<ClassVO> classList = session.selectList("Class-Mapper.selectClassList");
		return classList;
	}

	@Override
	public List<StudentVO> selectStudentByClass(String className) throws SQLException {
		List<StudentVO> studentByClassList = session.selectList("Class-Mapper.selectStudentByClass",className);
		return studentByClassList;
	}

	@Override
	public List<StudentVO> selectNotIncludeStudentByClass(String className) {
		List<StudentVO> studentByClassList = session.selectList("Class-Mapper.selectNotIncludeStudentByClass",className);
		return studentByClassList;
	}

	@Override
	public void deleteBelongOldInfo(HashMap<String, Object> params) {
		session.delete("Class-Mapper.deleteBelongOldInfo", params);
	}

	@Override
	public void InsertNewBelongInfo(HashMap<String, Object> params) {
		session.update("Class-Mapper.InsertNewBelongInfo", params);
		
	}

	@Override
	public int selectClassMaxClassId() {
		int result = session.selectOne("Class-Mapper.selectClassMaxClassId");
		return result;
	}

	@Override
	public void deleteBelongOldClassInfo(HashMap<String, Object> params) {
		session.selectOne("Class-Mapper.deleteBelongOldClassInfo", params);
	}

	@Override
	public void deleteClassTableAll() {
		session.selectOne("Class-Mapper.deleteClassTableAll");
	}

	@Override
	public void insertNewClassInfo(HashMap<String, Object> params) {
		session.selectOne("Class-Mapper.insertNewClassInfo", params);
	}
	
	
	
}

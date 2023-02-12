package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.SchoolVO;



public class SchoolDAOImpl implements SchoolDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<SchoolVO> selectschoolList(Criteria cri) throws SQLException {
		List<SchoolVO> student = session.selectList("School-Mapper.selectschool",cri);
		return student;
	}

	@Override
	public int insertSchool(HashMap<String, Object> params) throws SQLException {
		
		int result = session.insert("School-Mapper.insertSchool", params);
		return result;
	}

	@Override
	public void deleteSchool(HashMap<String, Object> params) throws SQLException {
		session.update("School-Mapper.deleteSchool", params);
		
	}

	@Override
	public void updateSchool(HashMap<String, Object> params) throws SQLException {
		session.update("School-Mapper.updateSchool", params);
		
	}

	@Override
	public List<SchoolVO> selectSimpleSchoolList() {
		List<SchoolVO> student = session.selectList("School-Mapper.selectSimpleSchoolList");
		return student;
	}

	
}

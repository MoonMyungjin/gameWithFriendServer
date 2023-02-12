package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.StudyPlanVO;
import com.lms.hexa.dto.SubjectAttendanceVO;

public class SubjectAttandanceDAOImpl implements SubjectAttandanceDAO{
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<SubjectAttendanceVO> selectBySubjectList(String mngId) throws SQLException {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("lessonAssignmentId", mngId);
		List<SubjectAttendanceVO> list = session.selectList("SubjectAttendance-Mapper.selectBySubjectList", parameters);
		return list;
	}
	
	
	@Override
	public List<SubjectAttendanceVO> selectBySubjectSearchList(Map<String,Object> sqlMap) throws SQLException {
		List<SubjectAttendanceVO> selectList = session.selectList("SubjectAttendance-Mapper.selectBySubjectListSearch", sqlMap);
		return selectList;
	}

	@Override
	public void insert(List<SubjectAttendanceVO> subjectAttendanceList) throws SQLException {
		Map<String,Object> insertMap= new HashMap<String,Object>();
		insertMap.put("subjectAttendanceList", subjectAttendanceList);
		session.insert("SubjectAttendance-Mapper.inserSubjectAttList",insertMap);
		
	}

	@Override
	public void update(SubjectAttendanceVO subject) throws SQLException {
		session.update("SubjectAttendance-Mapper.updateSubjectAttandance",subject);
		
	}

	@Override
	public void updateOut(SubjectAttendanceVO subject) throws SQLException {
		session.update("SubjectAttendance-Mapper.updateSubjectOutAttandance",subject);
		
	}

	@Override
	public void updateAll(HashMap<String, Object> params) throws SQLException {
		
		session.update("SubjectAttendance-Mapper.updateSubjectAll",params);
		
	}
	
	@Override
	public void updateAllCancle(HashMap<String, Object> params) throws SQLException {
		
		session.update("SubjectAttendance-Mapper.updateSubjectAllCancle",params);
		
	}

	@Override
	public void readyForInsertSubjectAtt(List<SubjectAttendanceVO> subjectAttendanceList) throws SQLException {
		Map<String,Object> insertMap= new HashMap<String,Object>();
		insertMap.put("subjectAttendanceList", subjectAttendanceList);
		session.selectList("SubjectAttendance-Mapper.readyForInsertSubjectAtt", insertMap);
		
	}
	

	@Override
	public List<SubjectAttendanceVO> forMainAjaxAtt(HashMap<String, Object> params) throws SQLException {
		
		List<SubjectAttendanceVO> selectOne = session.selectList("SubjectAttendance-Mapper.selectForMainAjax", params);
		
		return selectOne;
	}

	

}

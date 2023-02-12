package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.StudentVO;

public class StudentDAOImpl implements StudentDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public StudentVO selectStudentById(String id) throws SQLException {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);

		StudentVO student = session.selectOne("Student-Mapper.selectStudentById",parameters);
		return student;
	}

	@Override
	public List<StudentVO> selectStudentList(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<StudentVO> student = session.selectList("Student-Mapper.selectStudentList",cri,rowBounds);
		return student;
	}
	
	@Override
	public List<StudentVO> selectAllStudentList(Criteria cri) throws Exception {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<StudentVO> student = session.selectList("Student-Mapper.selectAllStudentList",cri,rowBounds);
		return student;
	}

	@Override
	public int selectStudentListTotalCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Student-Mapper.selectStudentListCount", cri);
		return count;
	}

	@Override
	public void insertStudent(StudentVO student) throws SQLException {
		session.update("Student-Mapper.insertStudent",student);
	}


	@Override
	public List<StudentVO> selectStudentIdList() throws SQLException {
		List<StudentVO> studentList = session.selectList("Student-Mapper.selectStudentIdList");
		return studentList;
	}


	@Override
	public StudentVO selectStudentByIdForAtt(String id) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectStudentByIdForAtt", id);
		return student;
	}

	@Override
	public void updatePwd(String emailAddress) throws SQLException {
		session.update("Student-Mapper.updatePwd", emailAddress);
		
	}
	
	@Override
	public void modifyPwd(StudentVO student) throws SQLException {
		session.update("Student-Mapper.modifyPwd", student);
	}

	@Override
	public List<StudentVO> selectStudentClassInfoList() throws SQLException {
		List<StudentVO> studentList = session.selectList("Student-Mapper.selectStudentClassInfoList");
		return studentList;
	}
	
	@Override
	public List<StudentVO> selectStudentScoreInfoList(int examId) throws SQLException {
		List<StudentVO> studentList = session.selectList("Student-Mapper.selectStudentScoreInfoList", examId);
		return studentList;
	}

	@Override
	public List<StudentVO> searchStudentList(String value) throws SQLException {
		List<StudentVO> studentList = session.selectList("Student-Mapper.searchStudentList", value);
		return studentList;
	}
	
	

	@Override
	public List<StudentVO> selectGenderCodeList() throws SQLException {
		List<StudentVO> genderCodeList = session.selectList("Student-Mapper.selectGenderCodeList");
		return genderCodeList;
	}

	@Override
	public List<StudentVO> selectGradeCodeList() throws SQLException {
		List<StudentVO> gradeCodeList = session.selectList("Student-Mapper.selectGradeCodeList");
		return gradeCodeList;
	}

	@Override
	public List<StudentVO> selectGradeCategoryCodeList() throws SQLException {
		List<StudentVO> gradeCategoryCodeList = session.selectList("Student-Mapper.selectGradeCategoryCodeList");
		return gradeCategoryCodeList;
	}

	@Override
	public List<StudentVO> selectStatusCodeList() throws SQLException {
		List<StudentVO> statusCodeList = session.selectList("Student-Mapper.selectStatusCodeList");
		return statusCodeList;
	}


	@Override
	public List<StudentVO> selectChildList(String parentId) throws SQLException {
		List<StudentVO> selectList = session.selectList("Student-Mapper.selectChildList",parentId);
		return selectList;
	}


	@Override
	public List<StudentVO> selectStudentListAll() throws Exception {
		List<StudentVO> student = session.selectList("Student-Mapper.selectStudentList");
		return student;
	}


	@Override
	public StudentVO selectStudentGetMain(String id) throws SQLException {
		StudentVO selectStudentList = session.selectOne("Student-Mapper.selectStudentMain",id);
		return selectStudentList;
	}


	@Override
	public StudentVO selectStudentDetail(String id) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectStudentDetail",id);
		return student;
	}

	@Override
	public int selectCountStNum(String id) throws SQLException {
		int selectOne = session.selectOne("Student-Mapper.countForCheckMemberSt",id);
		return selectOne;
	}

	


}

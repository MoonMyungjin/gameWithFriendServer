package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.StudentVO;

public interface StudentDAO {
	// 학생디테일
	StudentVO selectStudentDetail(String id) throws SQLException;
	
	StudentVO selectStudentById(String id) throws SQLException;
	
	StudentVO selectStudentByIdForAtt(String id) throws SQLException;
	
	List<StudentVO> selectStudentList(Criteria cri) throws Exception;
	List<StudentVO> selectAllStudentList(Criteria cri) throws Exception;
	
	// 자료 전체 개수
	int selectStudentListTotalCount(Criteria cri) throws SQLException;
	
	public void insertStudent(StudentVO student) throws SQLException;

	List<StudentVO> selectStudentIdList() throws SQLException;

	// 비밀번호 초기화
	public void updatePwd(String emailAddress) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(StudentVO student) throws SQLException;
	
	// 반 정보가 담긴 학생 리스트 가져오기
	public List<StudentVO> selectStudentClassInfoList() throws SQLException;
	
	// 점수가 담긴 학생 리스트 가져오기
	public List<StudentVO> selectStudentScoreInfoList(int examId) throws SQLException;
	
	//검색
	List<StudentVO> searchStudentList(String value) throws SQLException;
	
	// 성별 코드 가져오기
	List<StudentVO> selectGenderCodeList() throws SQLException;
	
	// 학년 코드 가져오기
	List<StudentVO> selectGradeCodeList() throws SQLException;
	
	// 학년 카테고리 코드 가져오기
	List<StudentVO> selectGradeCategoryCodeList() throws SQLException;

	// 상태 코드 가져오기
	List<StudentVO> selectStatusCodeList() throws SQLException;

	
	//부모아이디로 학생아이디 가져오기
	List<StudentVO> selectChildList(String parentId) throws SQLException;

	

	List<StudentVO> selectStudentListAll() throws Exception;
	
	StudentVO selectStudentGetMain(String id) throws SQLException; 
	
	
	//학생인지 직원인지 숫자 세기
	
	int selectCountStNum(String id) throws SQLException;

}

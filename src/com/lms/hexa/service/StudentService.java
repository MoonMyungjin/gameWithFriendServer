package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.dto.StudentVO;

public interface StudentService {
	
	public StudentVO getStudent(String id) throws Exception;
	
	// 학생 디테일
	public StudentVO getStudentDetail(String id) throws Exception;
	
	Map<String, Object> getStudentList(Criteria cri) throws Exception;
	
	// 학생 전체 리스트
	Map<String, Object> getStudentListAll() throws Exception;
	
	public void insertStudent(StudentVO student) throws SQLException;
	
	// 비밀번호 초기화
	void updatePwd(String emailAddress) throws Exception;
	

	// 비밀번호 수정
	public void modifyPwd(StudentVO student) throws SQLException;

	// 반 정보가 담긴 학생 리스트 가져오기
	public List<StudentVO> getStudentClassInfoList() throws Exception;
	
	// 점수가 담긴 학생 리스트 가져오기
	public List<StudentVO> getStudentScoreInfoList(int examId) throws Exception;
	
	// 검색
	List<StudentVO> getSearchStudentList(String value) throws Exception;
	
	Map<String, Object> getForMainStudent(DayInfo dayInfo,String id) throws Exception;
	
	int getCountForCheckSt(String id) throws Exception;
	
}

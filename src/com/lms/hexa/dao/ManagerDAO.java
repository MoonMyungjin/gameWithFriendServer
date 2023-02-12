package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.List;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.StudentVO;

public interface ManagerDAO {

	ManagerVO selectManagerById(String id) throws Exception;
	
	ManagerVO selectManagerById2(String id) throws Exception;
	
	//이름으로 검색하여 교사 list가져옴
	List<ManagerVO> selectWorkingTeacherListSearchByName(ManagerVO managerVO) throws Exception;
	List<ManagerVO> selectWorkingTeacherList()throws Exception;
	
	//아이디로 검색한 직원 세부정보
	ManagerVO selectManagerDetailById(String id) throws Exception;
	
	// managerList
	List<ManagerVO> selectManagerList(Criteria cri) throws Exception;
	
	// 매니저 리스트 아무것도 입력 안하고 긁어오기
	List<ManagerVO> selectManagerListForGoWork() throws Exception;
	
	// 검색 자료 개수
	int selectManagerListTotalCount(Criteria cri) throws Exception;
	
	// 비밀번호 초기화
	public void updatePwd(String emailAddress) throws SQLException;
	
	// 직원 insert 및 update
	public void insertManager(ManagerVO manager) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(ManagerVO manager) throws SQLException;
	
	// 성별 코드 가져오기
	List<ManagerVO> selectMngGenderList() throws SQLException;
	
	// 상태 코드 가져오기
	List<ManagerVO> selectMngDeleteList() throws SQLException;
	
	// 직분 코드 가져오기
	List<ManagerVO> selectDeptIdList() throws SQLException;

	
	// 과목 코드 가져오기
	List<ManagerVO> selectMngSubjectList() throws SQLException;

	
	//매니저 디테일 정보 가져오기 새창용
	ManagerVO selectMangerForDetail(String id) throws SQLException;



}

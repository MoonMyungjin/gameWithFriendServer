package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ManagerVO;

public interface ManagerService {
	
	public ManagerVO getManager(String id) throws Exception;
	
	//이름,과목 으로 검색한 재직교사list
	public List<ManagerVO> getWorkingTeacherListSearchByName(ManagerVO managerVO) throws Exception;
	
	public List<ManagerVO> getWorkingTeacherList() throws Exception;
	
	// managerList
	Map<String, Object> getManagerList(Criteria cri) throws Exception;
	
	//id로 검색한 직원세부정보
	public ManagerVO getManagerDetailById(String id) throws Exception;
	
	// 비밀번호 초기화
	void updatePwd(String emailAddress) throws Exception;
	
	// 직원 insert 및 update
	public void insertManager(ManagerVO manager) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(ManagerVO manager) throws SQLException;
	
	//메인용 서비스
	public Map<String, Object> getMain(String id) throws Exception;
	
	//새창용 매니저 디테일 
	public ManagerVO getManagerDetail(String id) throws Exception;
}

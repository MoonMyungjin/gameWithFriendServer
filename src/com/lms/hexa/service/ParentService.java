package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.dto.ParentVO;

public interface ParentService {
	// 비밀번호 초기화
	void updatePwd(String emailAddress) throws Exception;
	
	ParentVO getParent(String id) throws SQLException;
	
	// 비밀번호 수정
	public void modifyPwd(ParentVO parent) throws SQLException;
	
	public void insertParent(ParentVO parent) throws SQLException;
	
	public ParentVO selectParentByStudentId(String id) throws SQLException;
	
	public Map<String, Object> selectParentList(Criteria cri) throws SQLException;
	
	
	public Map<String, Object> getMain(DayInfo dayInfo,String id ,String studentId) throws Exception;
}

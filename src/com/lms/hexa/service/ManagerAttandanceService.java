package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.lms.hexa.command.AttandanceNum;
import com.lms.hexa.command.Criteria;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.StudentVO;


public interface ManagerAttandanceService {
	
	// 1depth 메뉴 리스트 조회
	Map<String, Object> getAttandanceList(AttandanceNum att) throws SQLException;
	
	Map<String, Object> getAttandanceList2(AttandanceNum att,String ajaxDate) throws SQLException;
	
	Map<String, Object> getAttandanceList3(AttandanceNum att,String ajaxDate) throws SQLException;
	
	Map<String, Object> getAttandanceStudentIdList(Criteria cri) throws SQLException;
	
	Map<String, Object> selectOutGetStudentId(Criteria cri) throws SQLException;
	
	void modify(String studentId) throws Exception;
	
	void modifyCancle(String studentId) throws Exception;
	
	void modifyAll(String atnId) throws Exception;
	
	void modifyAllCancle(String atnId) throws Exception;
	
	void modifyOut(String studentId) throws Exception;
	
	void modifyOutCancle(String studentId) throws Exception;
	
	void modifyByQr(String studentId) throws Exception;
	
	void modifyByQrz(String studentId) throws Exception;
	
	void insertDayAtt() throws SQLException;
	
	String selectAtt(String id) throws SQLException;
	
	ManagerAttandanceVO selectAttMember(ManagerAttandanceVO managerAttVO) throws SQLException;
	
	ManagerAttandanceVO selectAttMember2(Object object) throws SQLException;
	
	List<StudentVO> selectChildList(String parentId) throws SQLException;
	
	ManagerAttandanceVO selectForLate(String id) throws SQLException;
	
}

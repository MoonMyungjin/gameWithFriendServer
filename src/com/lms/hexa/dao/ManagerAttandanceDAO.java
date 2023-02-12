package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.AttandanceNum;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.SubjectAttendanceVO;
import com.lms.hexa.dto.TimeTableVO;



public interface ManagerAttandanceDAO {
	
	// 출석 내역 리스트 조회
	List<ManagerAttandanceVO> selectAttandanceList(AttandanceNum searchatt) throws SQLException;
	
	List<ManagerAttandanceVO> selectAttandancePlusList(Map<String, Object> dataMap) throws SQLException;
	
	List<ManagerAttandanceVO> selectAttandancePlusList2(Map<String, Object> dataMap) throws SQLException;
	
	List<ManagerAttandanceVO> selectAttandancePlusList3(Map<String, Object> dataMap) throws SQLException;
	
	List<ManagerAttandanceVO> selectAttandanceGetStudentIdList() throws SQLException;
	
	List<ManagerAttandanceVO> selectOutGetStudentId() throws SQLException;
	
	int selectAttandanceListTotalCount(AttandanceNum att) throws SQLException;
	
	int selectAttandanceListTotalCount2(AttandanceNum att) throws SQLException;
	
	int selectAttandanceListYNCount(AttandanceNum att) throws SQLException;
	
	void updateAttandance(String studentId) throws SQLException;
	
	void updateAttandanceCancle(String studentId) throws SQLException;
	
	void updateAttandanceAll(String atnId) throws SQLException;
	
	void updateAttandanceAllCancle(String atnId) throws SQLException;
	
	void updateOut(String studentId) throws SQLException;
	
	void updateOutCancle(String studentId) throws SQLException;
	
	void updateAttandanceQr(String studentId) throws SQLException;
	
	void updateAttandanceQrz(String studentId) throws SQLException;
	
	void insertDayAtt(List<StudentVO> studentList) throws SQLException;
	
	int selectAttSeqNext() throws SQLException;
	
	ManagerAttandanceVO selectAtt(String id) throws SQLException;
	
	ManagerAttandanceVO selectAttDate(String id) throws SQLException;
	
	ManagerAttandanceVO selectAttMember(ManagerAttandanceVO managerAttVO) throws SQLException;
	
	ManagerAttandanceVO selectAttMember2(Object object) throws SQLException;
	
	ManagerAttandanceVO selectForMain(String id) throws SQLException;
	
	ManagerAttandanceVO selectForLate(String id) throws SQLException;
}

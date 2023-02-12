package com.lms.hexa.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dto.ConsultingVO;


public interface ConsultingDAO {

	

	List<ConsultingVO> selectDivision() throws SQLException;
	List<ConsultingVO> selectTeacher() throws SQLException;
	List<ConsultingVO> selectStudent(String parentId) throws SQLException;
	List<ConsultingVO> selectSchedule(String mngId) throws SQLException;
	ConsultingVO selectScheduleDetailParentVer(String cnsltId) throws SQLException;
	
	
	int insertRequest(ConsultingVO consulting) throws SQLException;
	List<ConsultingVO> selectManagerSchedule(HashMap<String, Object> params);
	void updateConfirmY(String cnsltId) throws SQLException;
	void updateConfirmN(String cnsltId) throws SQLException;
	
	List<ConsultingVO> parentSelectCNSLTBeforList(String parentId) throws SQLException;
	List<ConsultingVO> studentSelectCNSLTBeforList(String studentId) throws SQLException;
	
	List<ConsultingVO> selectCNSLTBeforDetail(String cnsltId) throws SQLException;
	
	int studentUpdateConfirmN(String cnsltId) throws SQLException;
	
	
	List<ConsultingVO> managerSelectFinishList(ConsultingVO consulting) throws SQLException;
	
	
	ConsultingVO managerSelectFinishDetail(String cnsltId) throws SQLException;
	
	void updateRegist(ConsultingVO consulting) throws SQLException;
	
	List<ConsultingVO> memberSelectFinishDetailParentVer(String parentId) throws SQLException;
	List<ConsultingVO> memberSelectFinishDetailStudentVer(String studentId) throws SQLException;
	
	
}

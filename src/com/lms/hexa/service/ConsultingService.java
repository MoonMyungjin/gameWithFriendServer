package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.command.ConsultingRegistCommand;
import com.lms.hexa.dto.ConsultingVO;



public interface ConsultingService {
	


   	List<ConsultingVO> getDivision();
   	List<ConsultingVO> getTeacher();
   	List<ConsultingVO> getStudent(String parentId);
   	List<ConsultingVO> getManagerSchedule(HashMap<String, Object> params);
	 
   	int insertRequest(ConsultingVO consulting) throws SQLException;
   	
	List<ConsultingVO> getSchedule(String mngId);
	ConsultingVO getScheduleDetailParentVer(String cnsltId);
	void updateConfirmY(String cnsltId) throws SQLException;
	void updateConfirmN(String cnsltId) throws SQLException;

	
	List<ConsultingVO> getParentSelectCNSLTBeforList(String parentId);
	List<ConsultingVO> getStudentSelectCNSLTBeforList(String studentId);
	
	List<ConsultingVO> getSelectCNSLTBeforDetail(String cnsltId);
	
	int studentUpdateConfirmN(String cnsltId) throws SQLException;
	
	List<ConsultingVO> getselectCNSLFinishList(ConsultingVO consulting);
	
	ConsultingVO getManagerSelectFinishDetail(String cnsltId);
	
	void updateRegist(ConsultingVO consulting) throws SQLException;
	
	List<ConsultingVO> getmemberSelectFinishDetailParentVer(String parentId);
	List<ConsultingVO> getmemberSelectFinishDetailStudentVer(String studentId);
	

}

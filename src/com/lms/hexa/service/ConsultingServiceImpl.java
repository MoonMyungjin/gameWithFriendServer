package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.lms.hexa.dao.ConsultingDAO;
import com.lms.hexa.dto.ConsultingVO;


public class ConsultingServiceImpl implements ConsultingService {

	private ConsultingDAO consultingDAO;
	
	public void setConsultingDAO(ConsultingDAO consultingDAO) {
		this.consultingDAO = consultingDAO;
	}





	@Override
	public List<ConsultingVO> getDivision() {
		List<ConsultingVO> division = null;
		try {
			division = consultingDAO.selectDivision();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return division;
	}

	@Override
	public List<ConsultingVO> getTeacher() {
		List<ConsultingVO> teacher = null;
		try {
			teacher = consultingDAO.selectTeacher();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
	}





	@Override
	public List<ConsultingVO> getStudent(String parentId) {
		List<ConsultingVO> student = null;
		try {
			student = consultingDAO.selectStudent(parentId);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}
	
	
	@Override
	public List<ConsultingVO> getSchedule(String mngId) {
		System.out.println("consultingServiceImpl -> getSchedule에 왔다");
		List<ConsultingVO> schedule = null;
		try {
			schedule = consultingDAO.selectSchedule(mngId);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return schedule;
	}





	@Override
	public int insertRequest(ConsultingVO consulting) throws SQLException {
		int result = consultingDAO.insertRequest(consulting);
		return result;
	}

	@Override
	public List<ConsultingVO> getManagerSchedule(HashMap<String, Object> params) {
		List<ConsultingVO> managerScheduleList = consultingDAO.selectManagerSchedule(params);
		return managerScheduleList;
	}





	@Override
	public ConsultingVO getScheduleDetailParentVer(String cnsltId) {
		ConsultingVO scheduleDetailParentVer = null;
		try {
			scheduleDetailParentVer = consultingDAO.selectScheduleDetailParentVer(cnsltId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("--------------------------서비스-----------------------");
		System.out.println(scheduleDetailParentVer.getCnsltSchDate());
		return scheduleDetailParentVer;
	}





	@Override
	public void updateConfirmY(String cnsltId) throws SQLException {

		 consultingDAO.updateConfirmY(cnsltId);
	}





	@Override
	public void updateConfirmN(String cnsltId) throws SQLException{
		
		consultingDAO.updateConfirmN(cnsltId);
		
	}



	@Override
	public List<ConsultingVO> getParentSelectCNSLTBeforList(String parentId) {
		List<ConsultingVO> parentSelectCNSLTBeforList = null;
		try {
			parentSelectCNSLTBeforList = consultingDAO.parentSelectCNSLTBeforList(parentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parentSelectCNSLTBeforList;
	}





	@Override
	public List<ConsultingVO> getStudentSelectCNSLTBeforList(String studentId) {
		List<ConsultingVO> studentSelectCNSLTBeforList = null;
		try {
			studentSelectCNSLTBeforList = consultingDAO.studentSelectCNSLTBeforList(studentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				return studentSelectCNSLTBeforList;
	}


	@Override
	public List<ConsultingVO> getSelectCNSLTBeforDetail(String cnsltId) {
		List<ConsultingVO> parentSelectCNSLTBeforDetail= null;
		try {
			parentSelectCNSLTBeforDetail = consultingDAO.selectCNSLTBeforDetail(cnsltId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parentSelectCNSLTBeforDetail;
	}





	@Override
	public int studentUpdateConfirmN(String cnsltId) throws SQLException {
		int result = consultingDAO.studentUpdateConfirmN(cnsltId);
		return result;
	}





	@Override
	public List<ConsultingVO> getselectCNSLFinishList(ConsultingVO consulting) {
		List<ConsultingVO> selectCNSLFinishList= null;
		try {
			selectCNSLFinishList = consultingDAO.managerSelectFinishList(consulting);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectCNSLFinishList;
	}





	@Override
	public ConsultingVO getManagerSelectFinishDetail(String cnsltId) {
		ConsultingVO managerSelectFinishDetail = null;
		try {
			managerSelectFinishDetail = consultingDAO.managerSelectFinishDetail(cnsltId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return managerSelectFinishDetail;
	}





	@Override
	public void updateRegist(ConsultingVO consulting) throws SQLException {
		consultingDAO.updateRegist(consulting);
		
	}





	@Override
	public List<ConsultingVO> getmemberSelectFinishDetailParentVer(String parentId) {
		List<ConsultingVO> memberSelectFinishDetailParentVer = null;
		try {
			memberSelectFinishDetailParentVer = consultingDAO.memberSelectFinishDetailParentVer(parentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberSelectFinishDetailParentVer;
	}





	@Override
	public List<ConsultingVO> getmemberSelectFinishDetailStudentVer(String studentId) {
		List<ConsultingVO> memberSelectFinishDetailStudentVer = null;
		try {
			memberSelectFinishDetailStudentVer = consultingDAO.memberSelectFinishDetailStudentVer(studentId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberSelectFinishDetailStudentVer;
	}




}

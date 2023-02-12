package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.lms.hexa.command.AttandanceMaker;
import com.lms.hexa.command.AttandanceNum;
import com.lms.hexa.command.Criteria;
import com.lms.hexa.dao.ClassDAO;
import com.lms.hexa.dao.LessonDAO;
import com.lms.hexa.dao.ManagerAttandanceDAO;
import com.lms.hexa.dao.ManagerAttandanceDAOImpl;
import com.lms.hexa.dao.SchoolDAO;
import com.lms.hexa.dao.StudentDAO;
import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.ManagerAttandanceVO;
import com.lms.hexa.dto.StudentVO;

import sun.invoke.empty.Empty;



public class ManagerAttandanceServiceImpl implements ManagerAttandanceService{

	private ManagerAttandanceDAO managerAttandanceDAO;
	private StudentDAO studentDAO;
	private SchoolDAO schoolDAO;
	private ClassDAO classDAO;
	
	public void setManagerAttandanceDAO(ManagerAttandanceDAO managerAttandanceDAO) {
		this.managerAttandanceDAO = managerAttandanceDAO;
	}
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	public void setSchoolDAO(SchoolDAO schoolDAO) {
		this.schoolDAO = schoolDAO;
	}
	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}
	
	
	@Override
	public Map<String, Object> getAttandanceList(AttandanceNum att) throws SQLException {
		
		AttandanceNum searchatt = (AttandanceNum)att;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		AttandanceMaker attMaker = new AttandanceMaker();
		attMaker.setAtt(att);
		
		attMaker.setYnNum(managerAttandanceDAO.selectAttandanceListYNCount(searchatt));
		attMaker.setTotalNum(managerAttandanceDAO.selectAttandanceListTotalCount(searchatt));
		attMaker.setTotalNum2(managerAttandanceDAO.selectAttandanceListTotalCount2(searchatt));
		
		List<ManagerAttandanceVO> attandanceList = managerAttandanceDAO.selectAttandanceList(searchatt);
		dataMap.put("attandanceList", attandanceList);
		dataMap.put("attMaker", attMaker);
		List<ManagerAttandanceVO> selectAttandancePlusList = managerAttandanceDAO.selectAttandancePlusList(dataMap);
		dataMap.put("selectAttandancePlusList", selectAttandancePlusList);
		return dataMap;
	}
	
	
	@Override
	public Map<String, Object> getAttandanceList2(AttandanceNum att,String ajaxDate) throws SQLException {
		
		AttandanceNum searchatt = (AttandanceNum)att;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		AttandanceMaker attMaker = new AttandanceMaker();
		attMaker.setAtt(att);
		
		attMaker.setYnNum(managerAttandanceDAO.selectAttandanceListYNCount(searchatt));
		attMaker.setTotalNum(managerAttandanceDAO.selectAttandanceListTotalCount(searchatt));
		attMaker.setTotalNum2(managerAttandanceDAO.selectAttandanceListTotalCount2(searchatt));
		
		List<ManagerAttandanceVO> attandanceList = managerAttandanceDAO.selectAttandanceList(searchatt);
		dataMap.put("attandanceList", attandanceList);
		dataMap.put("attMaker", attMaker);
		dataMap.put("ajaxDate", ajaxDate);
		List<ManagerAttandanceVO> selectAttandancePlusList = managerAttandanceDAO.selectAttandancePlusList2(dataMap);
		dataMap.put("selectAttandancePlusList", selectAttandancePlusList);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getAttandanceList3(AttandanceNum att,String ajaxDate) throws SQLException {
		
		AttandanceNum searchatt = (AttandanceNum)att;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		AttandanceMaker attMaker = new AttandanceMaker();
		attMaker.setAtt(att);
		
		attMaker.setYnNum(managerAttandanceDAO.selectAttandanceListYNCount(searchatt));
		attMaker.setTotalNum(managerAttandanceDAO.selectAttandanceListTotalCount(searchatt));
		attMaker.setTotalNum2(managerAttandanceDAO.selectAttandanceListTotalCount2(searchatt));
		
		List<ManagerAttandanceVO> attandanceList = managerAttandanceDAO.selectAttandanceList(searchatt);
		dataMap.put("attandanceList", attandanceList);
		dataMap.put("attMaker", attMaker);
		dataMap.put("ajaxDate", ajaxDate);
		List<ManagerAttandanceVO> selectAttandancePlusList = managerAttandanceDAO.selectAttandancePlusList3(dataMap);
		dataMap.put("selectAttandancePlusList", selectAttandancePlusList);
		return dataMap;
	}

	@Override
	public Map<String, Object> getAttandanceStudentIdList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ManagerAttandanceVO> IdList = managerAttandanceDAO.selectAttandanceGetStudentIdList();
		
		if(IdList.size() != 0) {
		ManagerAttandanceVO studentIdItem = IdList.get(0);
		String studentId = studentIdItem.getStudentId();
		
		StudentVO studentById = studentDAO.selectStudentById(studentId);
		String schoolNo = studentById.getSchoolNo();
		String schoolName = schoolDAO.selectschoolList(null).get(0).getSchoolName();
		
		studentById.setSchoolName(schoolName);
		ClassVO classVO = classDAO.selectBelongById(studentId);
		String classId = classVO.getClassId();

		ClassVO classferfectVO = classDAO.selectClassById(classId);
		String className = classferfectVO.getClassName();
		String mngId = classferfectVO.getMngId();
		studentById.setMngId(mngId);
		studentById.setClassName(className);
		ManagerAttandanceVO att = managerAttandanceDAO.selectAttDate(studentId);
		dataMap.put("att",att);
		dataMap.put("studentById",studentById);
		dataMap.put("IdList", IdList);
		}
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectOutGetStudentId(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ManagerAttandanceVO> IdList = managerAttandanceDAO.selectOutGetStudentId();
		
		if(IdList.size() != 0) {
			ManagerAttandanceVO studentIdItem = IdList.get(0);
			String studentId = studentIdItem.getStudentId();
			
			StudentVO studentById = studentDAO.selectStudentById(studentId);
			String schoolNo = studentById.getSchoolNo();
			
			String schoolName = schoolDAO.selectschoolList(cri).get(0).getSchoolName();
			
			studentById.setSchoolName(schoolName);
			ClassVO classVO = classDAO.selectBelongById(studentId);
			String classId = classVO.getClassId();
			
			ClassVO classferfectVO = classDAO.selectClassById(classId);
			String className = classferfectVO.getClassName();
			String mngId = classferfectVO.getMngId();
			studentById.setMngId(mngId);
			studentById.setClassName(className);
			
			studentById.setSchoolName(schoolName);				
			
			ManagerAttandanceVO att = managerAttandanceDAO.selectAttDate(studentId);
			
			
			dataMap.put("att",att);
			dataMap.put("studentById",studentById);
			dataMap.put("IdList", IdList);
		}
		
		return dataMap;
	}

	@Override
	public void modify(String studentId) throws Exception {
		managerAttandanceDAO.updateAttandance(studentId);
		
	}
	
	@Override
	public void modifyCancle(String studentId) throws Exception {
		managerAttandanceDAO.updateAttandanceCancle(studentId);
		
	}
	
	@Override
	public void modifyAll(String atnId) throws Exception {
		managerAttandanceDAO.updateAttandanceAll(atnId);
		
	}
	
	@Override
	public void modifyAllCancle(String atnId) throws Exception {
		managerAttandanceDAO.updateAttandanceAllCancle(atnId);
		
	}
	
	@Override
	public void modifyOutCancle(String studentId) throws Exception {
		managerAttandanceDAO.updateOutCancle(studentId);
		
	}
	
	@Override
	public void modifyOut(String studentId) throws Exception {
		managerAttandanceDAO.updateOut(studentId);
		
	}
	@Override
	public void modifyByQr(String studentId) throws Exception {
		managerAttandanceDAO.updateAttandanceQr(studentId);
		
	}
	
	@Override
	public void modifyByQrz(String studentId) throws Exception {
		managerAttandanceDAO.updateAttandanceQrz(studentId);
		
	}
	@Override
	public void insertDayAtt() throws SQLException {
		List<StudentVO> studentList = studentDAO.selectStudentIdList();
		
		
		managerAttandanceDAO.insertDayAtt(studentList);
	}
	@Override
	public String selectAtt(String id) throws SQLException {
		ManagerAttandanceVO result = managerAttandanceDAO.selectAtt(id);
		String str = result.getAtnYnManager();
		return str;
	}
	@Override
	public ManagerAttandanceVO  selectAttMember(ManagerAttandanceVO managerAttVO) throws SQLException {
		
		ManagerAttandanceVO selectAttMember = managerAttandanceDAO.selectAttMember(managerAttVO);
		
		return selectAttMember;
	}
	@Override
	public List<StudentVO> selectChildList(String parentId) throws SQLException {
		List<StudentVO> selectChildList = studentDAO.selectChildList(parentId);
		return selectChildList;
	}
	@Override
	public ManagerAttandanceVO selectAttMember2(Object object) throws SQLException {
		ManagerAttandanceVO selectAttMember = managerAttandanceDAO.selectAttMember2(object);
		
		return selectAttMember;
	}
	@Override
	public ManagerAttandanceVO selectForLate(String id) throws SQLException {
		ManagerAttandanceVO selectForLate = managerAttandanceDAO.selectForLate(id);
		return selectForLate;
	}
	
	

	
	
	
	
}
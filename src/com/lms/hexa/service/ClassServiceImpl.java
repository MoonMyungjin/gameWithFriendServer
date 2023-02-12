package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.dao.ClassDAO;
import com.lms.hexa.dto.ClassVO;
import com.lms.hexa.dto.StudentVO;

public class ClassServiceImpl implements ClassService {
	
	protected ClassDAO classDAO;

	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}
	
	
	@Override
	public ClassVO selectClassById(String classId) throws SQLException {
		
		ClassVO result = classDAO.selectClassById(classId);
		return result;
	}

	@Override
	public ClassVO getClassInfoByStudentId(String studentId) {
		ClassVO classInfo = classDAO.selectClassInfoByStudentId(studentId);
		return classInfo;
	}


	@Override
	public List<ClassVO> getClassList() throws SQLException {
		List<ClassVO> classList = classDAO.selectClassList();
		
		return classList;
	}


	@Override
	public List<StudentVO> getStudentByClass(String className) throws SQLException {
		List<StudentVO> studentByClassList = classDAO.selectStudentByClass(className);
		
		for (StudentVO student : studentByClassList) {
			String outGrade = student.getGrade();
			
			String changeGrade = outGrade.split(" ")[0];
			
			if(changeGrade.equals("ELMNT")) {
				changeGrade = "초";
			} else if(changeGrade.equals("MDL")) {
				changeGrade = "중";
			} else {
				changeGrade = "고";
			}
			
			String inGrade = changeGrade + " " + outGrade.split(" ")[1];
			
			student.setGrade(inGrade);
			
		}
		
		return studentByClassList;
	}


	@Override
	public List<StudentVO> getNotIncludeStudentByClass(String className) {
		
		List<StudentVO> studentByClassList = classDAO.selectNotIncludeStudentByClass(className);
		
		for (StudentVO student : studentByClassList) {
			String outGrade = student.getGrade();
			
			String changeGrade = outGrade.split(" ")[0];
			
			if(changeGrade.equals("ELMNT")) {
				changeGrade = "초";
			} else if(changeGrade.equals("MDL")) {
				changeGrade = "중";
			} else {
				changeGrade = "고";
			}
			
			String inGrade = changeGrade + " " + outGrade.split(" ")[1];
			
			student.setGrade(inGrade);
			
		}
		
		return studentByClassList;
	}


	@Override
	public void registBelongValues(HashMap<String, Object> params) {
		classDAO.deleteBelongOldInfo(params);
		classDAO.InsertNewBelongInfo(params);
	}


	@Override
	public int getClassMaxClassId() {
		int maxVal = classDAO.selectClassMaxClassId();
		return maxVal;
	}


	@Override
	public void updateclassInfo(HashMap<String, Object> params) {
		
//		if(params.get("deletedClassId")!=null) {
//			classDAO.deleteBelongOldClassInfo(params);
//		}
		
		classDAO.deleteClassTableAll();
		classDAO.insertNewClassInfo(params);
		
	}


	

}

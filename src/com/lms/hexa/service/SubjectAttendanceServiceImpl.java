package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.PageMaker;
import com.lms.hexa.dao.LessonDAO;
import com.lms.hexa.dao.StudentDAO;
import com.lms.hexa.dao.SubjectAttandanceDAO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.SubjectAttendanceVO;

public class SubjectAttendanceServiceImpl implements SubjectAttendanceService {

	private SubjectAttandanceDAO subjectAttandanceDAO;
	private LessonDAO lessonDAO;
	private StudentDAO studentDAO;

	public void setSubjectAttandanceDAO(SubjectAttandanceDAO subjectAttandanceDAO) {
		this.subjectAttandanceDAO = subjectAttandanceDAO;
	}

	public void setLessonDAO(LessonDAO lessonDAO) {
		this.lessonDAO = lessonDAO;
	}
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	@Override
	public Map<String, Object> getByTeacherAttList(String mngId,Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		//session에서 받아온 매니저 아이디를 통해 할당테이블 키를 가져옴
		List<LessonVO> assignmentIdList = lessonDAO.selectByMngLessonAssignmentIdList(mngId);
		String lessonAssignmentId ="";
		List<SubjectAttendanceVO> subjectAttList = new ArrayList<SubjectAttendanceVO>();
		List<SubjectAttendanceVO> subjectList = new ArrayList<SubjectAttendanceVO>();
		List<SubjectAttendanceVO> tempList = new ArrayList<SubjectAttendanceVO>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
	
		for (int i = 0; i < assignmentIdList.size(); ++i) {

			LessonVO assignment = assignmentIdList.get(i);
			lessonAssignmentId = assignment.getLessonAssignmentId();
			
			
			subjectAttList = subjectAttandanceDAO.selectBySubjectList(lessonAssignmentId);
			for(int j =0; j< subjectAttList.size(); ++j) {
				 SubjectAttendanceVO subjectAttendanceVO = subjectAttList.get(j);
				 tempList.add(i, subjectAttendanceVO);
			}
		}
			String[] arr = new String[tempList.size()]; 
			String[] arr2 = new String[tempList.size()]; 
			for (int i =0; i <tempList.size(); ++i ) {
				
				String lessonAssignmentIdForLessonId = tempList.get(i).getLessonAssignmentId();
				String studentId = tempList.get(i).getStudentId();
				System.out.println(lessonAssignmentIdForLessonId);
				List<LessonVO> selectLessonId = lessonDAO.selectLessonId(lessonAssignmentIdForLessonId);
			
				String lessonId = selectLessonId.get(0).getLessonId();
				
				List<LessonVO> selectTakeLessonname = lessonDAO.selectTakeLessonname(lessonId);
				
				StudentVO selectStudentById = studentDAO.selectStudentById(studentId);
				String schoolName = selectStudentById.getSchoolName();
				
				String name = selectStudentById.getName();
				String hp = selectStudentById.getHp();
				String lessonName = selectTakeLessonname.get(0).getLessonName();
				String sattYN = tempList.get(i).getSattYN();
				tempList.get(i).setSchoolName(schoolName);
				tempList.get(i).setStudentName(name);
				tempList.get(i).setPhone(hp);
				tempList.get(i).setLessonName(lessonName);
				
				arr[i] = lessonName;
				arr2[i] = lessonAssignmentIdForLessonId;
				
				
			}
				LinkedHashSet<String> linkedHashSet = new LinkedHashSet<>(Arrays.asList(arr));
				String[] resultArr = linkedHashSet.toArray(new String[0]);
				LinkedHashSet<String> linkedHashSet2 = new LinkedHashSet<>(Arrays.asList(arr2));
				String[] resultArr2 = linkedHashSet2.toArray(new String[0]);
			for(int i =0; i<resultArr.length; ++i) {				
					SubjectAttendanceVO subjectAttendanceVO = new SubjectAttendanceVO();
					subjectList.add(subjectAttendanceVO);
					subjectList.get(i).setLessonName(resultArr[i]);
					subjectList.get(i).setLessonAssignmentId(resultArr2[i]);
					System.out.println(resultArr2[i]);
			
			}
			
			dataMap.put("subjectList", subjectList);
			dataMap.put("tempList", tempList);
			dataMap.put("subjectAttList", subjectAttList);
			dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<SubjectAttendanceVO> getByTeacherAttSearchList(Map<String, Object> sqlMap) throws SQLException {
		
		List<SubjectAttendanceVO> tempSearchList = subjectAttandanceDAO.selectBySubjectSearchList(sqlMap);
		
		return tempSearchList;
	}

	@Override
	public void insertSubjectList() throws SQLException {
		List<SubjectAttendanceVO> subjectAttendanceList = new ArrayList<SubjectAttendanceVO>();
		List<LessonVO> takeList = lessonDAO.selectTakeLesson();
		for (int i = 0; i < takeList.size(); ++i) {
			SubjectAttendanceVO subatt = new SubjectAttendanceVO();

			LessonVO lesson = takeList.get(i);
			String lessonAssignmentId = lesson.getLessonAssignmentId();
			String studentId = lesson.getStudentId();

			subatt.setStudentId(studentId);
			subatt.setLessonAssignmentId(lessonAssignmentId);

			subjectAttendanceList.add(i, subatt);
		}
		subjectAttandanceDAO.insert(subjectAttendanceList);
		

	}

	@Override
	public void updateSubject(SubjectAttendanceVO subject) throws SQLException {
		subjectAttandanceDAO.update(subject);
		
	}

	@Override
	public void updateOutSubject(SubjectAttendanceVO subject) throws SQLException {
		subjectAttandanceDAO.updateOut(subject);
		
	}

	@Override
	public void updateAll(HashMap<String, Object> params) throws SQLException {
		subjectAttandanceDAO.updateAll(params);
		
	}
	
	@Override
	public void updateAllCancle(HashMap<String, Object> params) throws SQLException {
		subjectAttandanceDAO.updateAllCancle(params);
		
	}
	
	@Override
	public List<SubjectAttendanceVO> forMainGetAttAjax(HashMap<String, Object> params) throws SQLException{
		List<SubjectAttendanceVO> forMainAjaxAtt = subjectAttandanceDAO.forMainAjaxAtt(params);
		return forMainAjaxAtt;
	}

	

}

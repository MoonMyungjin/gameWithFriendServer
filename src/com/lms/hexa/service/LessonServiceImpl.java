package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dao.LessonDAO;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StandardCodeVO;
import com.lms.hexa.dto.StudentVO;

public class LessonServiceImpl implements LessonService{

	private LessonDAO lessonDAO;
		
	public void setLessonDAO(LessonDAO lessonDAO) {
		this.lessonDAO = lessonDAO;
	}

	@Override
	public List<String> getManagerScheduleListById(String Id) throws SQLException {
		List<String> scheduleList = lessonDAO.selectManagerScheduleById(Id);
		return scheduleList;
	}

	@Override
	public Map<String,Object> getScodeValues() throws SQLException {
		Map<String,Object> scodeValues = new HashMap<String, Object>();
		
		List<StandardCodeVO> subjectList = lessonDAO.selectSubjectList();
		List<StandardCodeVO> LessonStateList = lessonDAO.selectLessonStateList();
		List<StandardCodeVO> StudentGradeCategoryCodeList = lessonDAO.selectStudentGradeCategoryCodeList();
		List<LessonRoomVO> lessonRoomList = lessonDAO.selectLessonRoomList();
		
		
		scodeValues.put("subjectList",subjectList);
		scodeValues.put("LessonStateList",LessonStateList);
		scodeValues.put("StudentGradeCategoryCodeList",StudentGradeCategoryCodeList);
		scodeValues.put("lessonRoomList",lessonRoomList);
		
		return scodeValues;
	}

	@Override
	public int registNewLesson(LessonVO lessonVO) throws SQLException {
		int result = 0;
		
		int lessonAssignmentId = lessonDAO.selectLessonAssignmentSeqNext();
		lessonVO.setLessonAssignmentId(""+lessonAssignmentId);
		
		lessonDAO.InsertNewLessonInfo(lessonVO);
		result = lessonDAO.InsertNewLessonTimeValues(lessonVO);
		
		return result;
	}

	@Override
	public List<LessonVO> getLessonListByTeacherName(Map<String, Object> searchInfoMap) throws SQLException {
		List<LessonVO> lessonList = lessonDAO.selectLessonSearchList(searchInfoMap);
		return lessonList;
	}

	@Override
	public List<StandardCodeVO> getLessonStateCodeList() throws SQLException {
		List<StandardCodeVO> lessonStateCodeList = lessonDAO.selectLessonStateCodeList();
		return lessonStateCodeList;
	}

	@Override
	public Map<String, Object> getStudentListByLessonId(String lessonId) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<StudentVO> includeList = lessonDAO.selectIncludeStudentListByLessonID(lessonId);
		List<StudentVO> notIncludeList = lessonDAO.selectNotIncludeStudentListByLessonID(lessonId);
		
		dataMap.put("includeList",includeList);
		dataMap.put("notIncludeList",notIncludeList);
		return dataMap;
	}

	@Override
	public int registTakeLessonValues(HashMap<String, Object> params) {
		lessonDAO.deleteOldInfo(params);
		int result = lessonDAO.insertTakeLessonValues(params);
		
		return result;
	}

	@Override
	public Map<String, Object> getSearchIncludeStudentList(Criteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<StudentVO> includeList = lessonDAO.selectSearchIncludeStudentList(cri);
		
		dataMap.put("cri",cri);
		dataMap.put("includeList",includeList);
		return dataMap;
	}

	@Override
	public Map<String, Object> getSearchNotIncludeStudentList(Criteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<StudentVO> notIncludeList = lessonDAO.selectSearchNotIncludeStudentList(cri);
		
		dataMap.put("cri",cri);
		dataMap.put("notIncludeList",notIncludeList);
		return dataMap;
	}

	@Override
	public int registLesson(LessonVO lessonVO) {
		int result = lessonDAO.insertLesson(lessonVO);
		
		return result;
	}

	@Override
	public List<LessonVO> getModuleLessonListByTeacherName(SearchHelper sh,Criteria cri) throws SQLException{
		List<LessonVO> lessonList = lessonDAO.selectModuleLessonList(sh,cri);
		
		return lessonList;
	}

	@Override
	public List<LessonVO> getManagerScheduleListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> scheduleList = lessonDAO.selectManagerScheduleListByPeriod(params);
		return scheduleList;
	}
	
	@Override
	public List<String> getManagerScheduleListByPeriodNotIncludeClassRoom(HashMap<String, Object> params) {
		List<String> scheduleList = lessonDAO.selectManagerScheduleListByPeriodNotIncludeClassRoom(params);
		return scheduleList;
	}

	@Override
	public List<LessonRoomVO> getAvailableLessonRoomList(HashMap<String, Object> params) {
		List<LessonRoomVO> lessonRoomList = lessonDAO.selectAvailableLessonRoomList(params);
		return lessonRoomList;
	}

	@Override
	public LessonVO getLessonInfoByLessonAssignmentId(String lessonAssignmentId) {
		LessonVO lesson = lessonDAO.selectLessonInfoByLessonAssignmentId(lessonAssignmentId);
		return lesson;
	}

	@Override
	public List<StudentVO> getIncludeStudentListByLessonAssignmentId(String lessonAssignmentId) {
		List<StudentVO> includeList = lessonDAO.selectIncludeStudentListByLessonID(lessonAssignmentId);
		return includeList;
	}

	@Override
	public List<String> getLessonScheduleListByLessonAssignmentId(String lessonAssignmentId) {
		List<String> includeList = lessonDAO.selectLessonScheduleListByLessonAssignmentId(lessonAssignmentId);
		return includeList;
	}

	@Override
	public int getModuleLessonListCountByTeacherName(SearchHelper sh) throws Exception {
		List<LessonVO> lessonList = lessonDAO.selectModuleLessonListCount(sh);
		int result = lessonList.size();
		return result;
	}

	@Override
	public int getLessonCount() {
		int count = lessonDAO.selectLessonCount();
		return count;
	}

	@Override
	public List<LessonVO> getLessonIntegratedSearchList(Map<String, Object> searchInfoMap) {
		List<LessonVO> lessonList = lessonDAO.selectLessonIntegratedSearchList(searchInfoMap);
		return lessonList;
	}

	@Override
	public int modifyLessonAssignmentDetailInfo(LessonVO lessonVO) {
		int result = lessonDAO.updateLessonAssignmentDetailInfo(lessonVO);
		return result;
	}

	@Override
	public Map<String, Object> getbyDayMap(DayInfo dayInfo) {
		Map<String, Object> byDayMap = new HashMap<String, Object>();
		List<LessonVO> mondayList = lessonDAO.selectdayList(dayInfo.getMonday());
		List<LessonVO> tuesdayList = lessonDAO.selectdayList(dayInfo.getTuesday());
		List<LessonVO> wednesdayList = lessonDAO.selectdayList(dayInfo.getWednesday());
		List<LessonVO> thursdayList = lessonDAO.selectdayList(dayInfo.getThursday());
		List<LessonVO> fridayList = lessonDAO.selectdayList(dayInfo.getFriday());
		List<LessonVO> saturdayList = lessonDAO.selectdayList(dayInfo.getSaturday());
		
		byDayMap.put("mondayList", mondayList);
		byDayMap.put("tuesdayList", tuesdayList);
		byDayMap.put("wednesdayList", wednesdayList);
		byDayMap.put("thursdayList", thursdayList);
		byDayMap.put("fridayList", fridayList);
		byDayMap.put("saturdayList", saturdayList);
		
		return byDayMap;
	}

	@Override
	public List<LessonRoomVO> getAllLessonRoomList() throws SQLException {
		
		List<LessonRoomVO> lessonRoomList = lessonDAO.selectLessonRoomList();
		
		return lessonRoomList;
	}

	@Override
	public LessonVO getModuleLessonDetail(String lessonId) {
		LessonVO lesson = lessonDAO.selectModuleLessonDetail(lessonId);
		return lesson;
	}

	@Override
	public List<LessonVO> getModuleNotSearchLessonList(String keyword) {
		List<LessonVO> lessonList = lessonDAO.selectModuleNotSearchLessonList(keyword);
		
		return lessonList;
	}

	@Override
	public Map<String, Object> getbyDayUserMap(DayInfo dayInfo, String studentId) {
		Map<String, Object> byDayMap = new HashMap<String, Object>();
		List<LessonVO> mondayList = lessonDAO.selectdayUserList(dayInfo.getMonday(),studentId);
		List<LessonVO> tuesdayList = lessonDAO.selectdayUserList(dayInfo.getTuesday(),studentId);
		List<LessonVO> wednesdayList = lessonDAO.selectdayUserList(dayInfo.getWednesday(),studentId);
		List<LessonVO> thursdayList = lessonDAO.selectdayUserList(dayInfo.getThursday(),studentId);
		List<LessonVO> fridayList = lessonDAO.selectdayUserList(dayInfo.getFriday(),studentId);
		List<LessonVO> saturdayList = lessonDAO.selectdayUserList(dayInfo.getSaturday(),studentId);
		
		byDayMap.put("mondayList", mondayList);
		byDayMap.put("tuesdayList", tuesdayList);
		byDayMap.put("wednesdayList", wednesdayList);
		byDayMap.put("thursdayList", thursdayList);
		byDayMap.put("fridayList", fridayList);
		byDayMap.put("saturdayList", saturdayList);
		
		return byDayMap;
	}

	@Override
	public List<LessonVO> getStudentScheduleListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> lessonList = lessonDAO.selectStudentScheduleListByPeriod(params);
		
		return lessonList;
	}

	@Override
	public List<LessonVO> getLessonListByPeriod(HashMap<String, Object> params) {
		List<LessonVO> lessonList = lessonDAO.selectLessonListByPeriod(params);
		
		return lessonList;
	}

	@Override
	public String checkUserLesson(LessonVO lessonVO) {
		String result = lessonDAO.isUserLesson(lessonVO);
		
		return result;
	}

	@Override
	public int cancellationGo(HashMap<String, Object> params) {
		int result = lessonDAO.cancellationGo(params);
		return result;
	}

	@Override
	public int lessonApplyGo(HashMap<String, Object> params) {
		int result = lessonDAO.lessonApplyGo(params);
		return result;
	}

	@Override
	public int registSyllabusToDataBase(HashMap<String, Object> params) {
		int result = lessonDAO.insertSyllabusToDataBase(params);
		return result;
	}

	@Override
	public String getSyllabusAddress(String lessonAssignmentId) {
		String result = lessonDAO.selectSyllabusAddress(lessonAssignmentId);
		return result;
	}

	@Override
	public void updateLessonState() {
		lessonDAO.updateLessonStateByStartDate();
		lessonDAO.updateLessonStateByEndDate();
		lessonDAO.updateCheckLessonCloseByStartDate();
	}

	@Override
	public void updateLessonAssignmentTableLaTimeInfo(HashMap<String, Object> params) {
		lessonDAO.updateLessonAssignmentTableLaTimeInfo(params);
	}


}

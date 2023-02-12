package com.lms.hexa.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.hexa.command.Criteria;
import com.lms.hexa.command.CriteriaCommand;
import com.lms.hexa.command.DayInfo;
import com.lms.hexa.command.SearchHelper;
import com.lms.hexa.dto.LessonRoomVO;
import com.lms.hexa.dto.LessonVO;
import com.lms.hexa.dto.StandardCodeVO;
import com.lms.hexa.dto.StudentVO;

public interface LessonService {
	
	// 직원 일정조회
	List<String> getManagerScheduleListById(String Id) throws SQLException;
	
	// select option으로 뿌릴 공통코드 가져오기
	Map<String,Object> getScodeValues() throws SQLException;
	
	// 수업 등록
	int registNewLesson(LessonVO lessonVO) throws SQLException;
	
	// 수업 list 조회
	List<LessonVO> getLessonListByTeacherName(Map<String, Object> searchInfoMap) throws SQLException;
	
	// 수업상태 list 조회
	List<StandardCodeVO> getLessonStateCodeList() throws SQLException;
	
	// 수업ID로 조회한 회원 list
	Map<String, Object> getStudentListByLessonId(String lessonId);
	
	// 해당수업을 듣는 회원list 등록
	int registTakeLessonValues(HashMap<String, Object> params);
	
	// 해당수업 듣는 회원검색list 
	Map<String, Object> getSearchIncludeStudentList(Criteria cri);

	// 해당수업 듣지않는 회원검색list 
	Map<String, Object> getSearchNotIncludeStudentList(Criteria cri);
	
	// 수업 생성
	int registLesson(LessonVO lessonVO);
	
	// 수업기본정보List
	List<LessonVO> getModuleLessonListByTeacherName(SearchHelper sh,Criteria cri) throws SQLException;
	
	// 기간,강의실 에 따른 직원 일정조회
	List<LessonVO> getManagerScheduleListByPeriod(HashMap<String, Object> params);
	
	// 기간에 따른 직원 일정조회
	List<String> getManagerScheduleListByPeriodNotIncludeClassRoom(HashMap<String, Object> params);
	
	// 기간에 따른 가능 강의실 조회
	List<LessonRoomVO> getAvailableLessonRoomList(HashMap<String, Object> params);
	
	// 강의배정 Id를 통해 강의 세부정보 가져오기
	LessonVO getLessonInfoByLessonAssignmentId(String lessonAssignmentId);
	
	// 해당수업을 듣는 회원list
	List<StudentVO> getIncludeStudentListByLessonAssignmentId(String lessonAssignmentId);
	
	// 해당수업의 수업시간정보 가져오기
	List<String> getLessonScheduleListByLessonAssignmentId(String lessonAssignmentId);

	// 강의 전체 listcount
	int getModuleLessonListCountByTeacherName(SearchHelper sh)throws Exception;
	
	// 수업 전체 listcount
	int getLessonCount();
	
	// 수업 전체 list
	List<LessonVO> getLessonIntegratedSearchList(Map<String, Object> searchInfoMap);
	
	// 수업상세 수정
	int modifyLessonAssignmentDetailInfo(LessonVO lessonVO);
	
	// 수업상세 조회
	LessonVO getModuleLessonDetail(String lessonId);
	
	// 요일별 수업정보 조회
	Map<String, Object> getbyDayMap(DayInfo dayInfo);

	List<LessonRoomVO> getAllLessonRoomList()throws SQLException;

	List<LessonVO> getModuleNotSearchLessonList(String keyword);

	Map<String, Object> getbyDayUserMap(DayInfo dayInfo, String studentId);

	List<LessonVO> getStudentScheduleListByPeriod(HashMap<String, Object> params);

	List<LessonVO> getLessonListByPeriod(HashMap<String, Object> params);

	String checkUserLesson(LessonVO lessonVO);

	int cancellationGo(HashMap<String, Object> params);

	int lessonApplyGo(HashMap<String, Object> params);

	int registSyllabusToDataBase(HashMap<String, Object> params);

	String getSyllabusAddress(String lessonAssignmentId);

	void updateLessonState();

	void updateLessonAssignmentTableLaTimeInfo(HashMap<String, Object> params);


}
